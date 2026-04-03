---
status: draft
owner: argus
priority: high
description: Monitor trust bonds across ecosystem for expiration and validity
---

## Purpose

Trust bonds are the cryptographic foundation of entity authority. Argus must continuously monitor all trust bonds (koad-to-entity, inter-entity) and alert before expiration. Expired bonds break chains of custody and can halt critical operations.

## Specification

**Input:** None (scans all entities and trust/ directory)

**Output:** Report with:
- All active trust bonds and expiration dates
- Bonds expiring within 30 days (WARNING)
- Expired bonds (CRITICAL)
- Bond validity status (signature, key match, chain completeness)

**Behavior:**
- Scan all entity directories for trust/ bonds
- Parse each bond (YAML frontmatter + signature)
- Verify signature validity and key match
- Check expiration date against current date
- Flag bonds within 30 days of expiration
- Flag expired bonds
- Generate alert report
- If any CRITICAL: notify Salus for renewal

**Bond checklist per entity:**
- At least one koad-to-<entity> present and valid
- All inter-entity bonds referenced in CLAUDE.md are present
- No expired bonds remain in directory
- All signatures validate against declared keys

## Implementation

Not yet built. Requires trust bond schema validation and cryptographic verification.

## Dependencies

- VESTA-SPEC-003 (Trust Bonds) — canonical
- VESTA-SPEC-009 (Identity Keys) — for key validation
- Cryptographic libraries (openssl, libsodium or similar)

## Testing

Acceptance criteria:
- [ ] Correctly identifies expiration dates
- [ ] Validates bond signatures
- [ ] Alerts 30+ days before expiration
- [ ] Detects missing expected bonds
- [ ] Works with all bond key types (Ed25519, ECDSA, RSA)

## Status Note

Important for security operations but lower priority than immediate diagnostics. Blocked pending trust bond schema finalization (VESTA-SPEC-003).
