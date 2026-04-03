---
status: draft
owner: argus
priority: high
description: Monitor trust bonds for expiration and validity
---

## Purpose

Continuously monitor all trust bonds across the ecosystem. Alert before expiration and verify signature validity.

## Interface

**Arguments:** None (scans all entities)

**Output:** Report with bond status and expiration alerts

## Specification

Checks:
- All active bonds and expiration dates
- Bonds within 30 days of expiration (WARNING)
- Expired bonds (CRITICAL)
- Signature validity and key match
- Bond chain completeness per entity

## Testing

Acceptance criteria:
- [ ] Correctly identifies expiration dates
- [ ] Validates bond signatures
- [ ] Alerts 30+ days before expiration
- [ ] Detects missing expected bonds

## Status Note

Important for security. Blocked pending trust bond schema finalization (VESTA-SPEC-003).
