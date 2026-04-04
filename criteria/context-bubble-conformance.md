---
type: audit-checklist
title: Context Bubble Conformance Criteria
spec: VESTA-SPEC-016
version: 1.0
date: 2026-04-03
owner: argus
description: Operational checklist for auditing context bubbles against VESTA-SPEC-016 requirements
---

# Context Bubble Conformance Criteria

**Authority:** VESTA-SPEC-016 §10 — Audit Criteria  
**Owner:** Argus  
**Purpose:** Systematic verification of context bubble integrity, ownership, and conformance

---

## Audit Checklist

### 1. Signature Validity

**Requirement:** Every bubble signature must be verifiable with the owner's public key.

**Check:**
- [ ] Bubble has `signature:` field in frontmatter
- [ ] Signature field is non-empty and valid Saltpack format
- [ ] Owner's public key is available (in trust directory or peer registry)
- [ ] Signature verification succeeds (no tampering detected)
- [ ] Signature covers all content except the `signature:` line itself

**Failure mode:** `SIGNATURE_INVALID` — bubble is quarantined; alert owner  
**Recovery:** Restore from peer if available; mark as untrusted pending owner contact

---

### 2. Moment Hashes

**Requirement:** Moment `content_hash` must match referenced session transcript segment.

**Check:**
- [ ] Bubble contains `moments:` array with moment definitions
- [ ] Each moment has `session_id`, `timestamp_start`, `timestamp_end`
- [ ] Each moment has `content_hash` field (SHA256 hex string)
- [ ] Session transcript exists at referenced location
- [ ] Transcript segment [timestamp_start, timestamp_end] hashes to `content_hash` (normalized per spec §4.4)
- [ ] Hash match succeeds for all moments

**Failure mode:** `HASH_MISMATCH` — moment is corrupted or tampered  
**Recovery:** Compare with peer copy; if peer hash differs, contact owner

---

### 3. Topic Taxonomy

**Requirement:** Topics must follow registered taxonomy or be flagged as novel.

**Check:**
- [ ] Bubble has `topic:` field in frontmatter
- [ ] Topic is non-empty alphanumeric string (letters, numbers, hyphens)
- [ ] Topic matches registered topics in daemon registry (if available)
- [ ] If topic is novel (not in registry), flag as `WARN: novel-topic` but don't fail
- [ ] Topic is consistent across all moments in the bubble

**Failure mode:** `INVALID_TOPIC` — topic format violates taxonomy  
**Recovery:** Request topic change from owner; do not accept until conformant

---

### 4. Temporal Consistency

**Requirement:** Moments must be in chronological order; timestamps must fall within their session's timespan.

**Check:**
- [ ] Moments are sorted chronologically by `timestamp_start`
- [ ] For each moment: `timestamp_start` < `timestamp_end`
- [ ] For each moment: session exists and session timespan includes [timestamp_start, timestamp_end]
- [ ] Moment durations are reasonable (no zero-length moments; max 24 hours per moment)
- [ ] Timestamps are valid ISO-8601 UTC format

**Failure mode:** `TEMPORAL_INCONSISTENCY` — moments out of order or timestamps invalid  
**Recovery:** Request corrected bubble from owner; do not accept out-of-order moments

---

### 5. Chain Integrity

**Requirement:** If a bubble references `canonical_chain`, those parent bubbles must exist and be accessible.

**Check:**
- [ ] If `canonical_chain:` field exists, it contains valid bubble UUIDs
- [ ] For each parent UUID in chain: parent bubble exists (locally or via peer query)
- [ ] Parent bubble signature is valid (verifiable)
- [ ] Parent bubble topic is related to child topic (semantic check, warn only)
- [ ] Parent bubble creation date is before child creation date
- [ ] Chain is acyclic (no circular references)

**Failure mode:** `CHAIN_BROKEN` — parent bubble missing or invalid  
**Recovery:** Attempt to fetch from source kingdom; if unavailable, mark as orphaned and warn

---

### 6. Ownership

**Requirement:** Bubble `is_shared` flag and owner match the signing entity.

**Check:**
- [ ] Bubble has `created_by:` field (entity name)
- [ ] Bubble has `owned_by:` field (kingdom FQDN or entity name)
- [ ] Bubble has `is_shared:` field (boolean)
- [ ] Signature is created by the entity in `created_by` field
- [ ] If `is_shared: true`, bubble must be marked for distribution; access controls are enforced
- [ ] If `is_shared: false`, bubble is private to owning kingdom

**Failure mode:** `OWNERSHIP_MISMATCH` — signer doesn't match owner  
**Recovery:** Reject bubble; contact owner for clarification

---

### 7. Read-Only Enforcement (for Shared Bubbles)

**Requirement:** Shared bubbles (in `shared-in/` directories) must have valid signatures; local edits invalidate them.

**Check:**
- [ ] If bubble is in `~/{entity}/bubbles/shared-in/`, it originated from peer
- [ ] Bubble signature is valid and from source kingdom (not local entity)
- [ ] File permissions are read-only (mode 0444) if supported
- [ ] Content matches peer's canonical version (hash verification)
- [ ] Any local modifications are rejected (signature fails if edited)

**Failure mode:** `TAMPERED_SHARED_BUBBLE` — shared bubble has been edited  
**Recovery:** Restore from peer; if unavailable, delete local copy; alert owner

---

### 8. API Compliance

**Requirement:** Daemon bubble endpoints must respond to standard queries; rate limiting must be enforced.

**Check:**
- [ ] Daemon exposes `/api/v1/peer/bubbles` endpoint
- [ ] `/api/v1/peer/bubbles?topic=<topic>&after=<date>` returns matching bubbles
- [ ] `/api/v1/peer/bubbles/<bubble-id>` returns bubble content and signature
- [ ] `/api/v1/peer/bubbles/registry` returns topic registry
- [ ] `/api/v1/peer/bubbles/revoked?after=<ISO-8601>` returns revocation list
- [ ] Rate limiting is enforced per tier (per VESTA-SPEC-014)
- [ ] Responses include all required fields: id, topic, created_at, created_by, description, is_shared, content_hash, signature_sha256
- [ ] API responds within SLA (< 2s for single bubble, < 5s for registry)

**Failure mode:** `API_UNRESPONSIVE` or `API_INCOMPLETE` — endpoints missing or malformed  
**Recovery:** Log failure; retry on next audit cycle; escalate if persistent

---

## Audit Severity Levels

| Level | Criteria | Action |
|-------|----------|--------|
| **PASS** | All checks succeed | Bubble is conformant; log as verified |
| **WARN** | Non-critical checks fail (e.g., novel topic) | Bubble is usable; flag deviation for owner awareness |
| **FAIL** | Critical checks fail (signature, hash, ownership) | Bubble is unusable; quarantine; file issue; alert owner |
| **HOLD** | Checks cannot be completed (peer unavailable, session missing) | Bubble is unauditable; retry later; log attempt |

---

## Audit Output Format

Each audit produces a report with:

```yaml
bubble_id: <uuid>
audit_date: <ISO-8601>
auditor: argus
status: PASS | WARN | FAIL | HOLD
checks:
  - check_name: <string>
    status: ✓ | ⚠ | ✗ | ?
    message: <string>
findings: [list of deviations]
remediation: [suggested actions if FAIL or WARN]
moment_hashes: [list of verified moment hashes]
```

---

## Automation

Argus audit command:
```bash
argus audit context-bubble --bubble-id <uuid> [--repair]
argus audit context-bubble --entity <name> --spec <VESTA-SPEC-ID>
```

Run on:
- **On-demand:** When investigating a specific bubble
- **Scheduled:** Weekly scan of all bubbles in local registry
- **On ingest:** When a bubble is received from peer (before storing)
- **On publish:** When a local entity creates a bubble (before sharing)

---

## Related

- VESTA-SPEC-016 (Context Bubble Protocol) — full specification
- memories/003-mercury-gate.md — Mercury content gating (uses bubbles for claim traceability)
- features/context-bubble-entity-audit.md — Entity behavior auditing using bubbles
- features/context-bubble-content-gate.md — Mercury content gate (claim traceability)
