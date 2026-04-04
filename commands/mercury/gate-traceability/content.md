---
status: draft
owner: argus
priority: critical
description: Gate Mercury content by verifying claims are traceable to context bubbles
---

## Purpose

Extend Argus's Mercury content gate to verify claim **traceability**. Every claim in Mercury content must be traceable to a context bubble where it was formed, tested, or validated.

A claim without a verifiable bubble is unverifiable — it cannot reach OpenClaw.

## Interface

**Arguments:**
- `--content <path>` — Path to Mercury publish request (markdown or JSON)
- `--trace-depth <level>` — Trace thoroughness (quick|standard|deep) (default: standard)

**Example:**
```bash
~/.argus/commands/mercury/gate-traceability \
  --content ~/.mercury/drafts/post-2026-04-03.md \
  --trace-depth standard
```

**Output:** Gate verdict (GO | STOP | HOLD) with:
- Extracted claims from content
- Traceability result for each claim (found → bubble | missing | unverifiable)
- Moment references (session ID, timestamp, hash)
- Claim scope verification (matches bubble scope?)
- Contradiction detection (e.g., caveats in bubble not in claim)
- Remediation path if STOP (which claim needs tracing; what bubble evidence is missing)

## Specification

1. **Claim extraction** — Parse Mercury content for factual statements:
   - Feature announcements
   - Status updates
   - Performance/capability claims
   - Incident announcements
   - Deadlines or commitments

2. **Trace to bubbles** — For each claim:
   - Query bubble registry by topic/tag
   - Search for moments where claim was formed, tested, or validated
   - Extract moment hash and session reference
   - Verify claim scope against bubble scope

3. **Gate decision:**
   - GO: All claims traced; scopes match; no contradictions
   - STOP: Claim untraced; scope exceeds evidence; contradictions detected
   - HOLD: Bubble exists but draft/unsigned; claim newer than bubbles; Veritas review pending

4. **Log decision** in reports/mercury-publish-log.md with claim → bubble trace

## Integration with Existing Gate

This is an **additional layer** on top of existing Mercury gate (schedule, stop blocks, pipeline, hard stop).

Decision flow:
```
Mercury publish → [Existing checks] → Traceability check (bubble verification) → Final verdict
```

## Testing

Acceptance criteria:
- [ ] Claim extraction from Mercury content works with >95% accuracy
- [ ] Traces to bubbles succeed for verifiable claims
- [ ] Traces fail gracefully when no bubble exists
- [ ] Claim scope is compared correctly against bubble scope
- [ ] Contradictions in bubbles are flagged
- [ ] Moment hashes are logged (verifiable)
- [ ] STOP decisions clearly state which claim failed and why
- [ ] All publishes logged with traceability verdict

## Status Note

Draft command placeholder. Critical standing assignment. Implementation blocks on:
- Claim extraction heuristics (NLP or pattern matching)
- Bubble registry query API (VESTA-SPEC-016)
- Claim-scope comparison logic
- Extended publish log format
