---
status: draft
owner: argus
priority: high
description: Audit entity conformance to declared VESTA spec versions
---

## Purpose

Verify that entities' declared spec conformance (VESTA-SPEC-001, -003, etc.) matches actual implementation. Catches spec drift.

## Interface

**Arguments:** Entity path

**Output:** Report of conformance per declared spec

## Specification

For each declared spec:
- Load spec from ~/.vesta/specs/
- Check implementation completeness
- Verify required files, commands, hooks exist
- Compare declared vs. actual implementation
- Flag gaps

## Testing

Acceptance criteria:
- [ ] Detects spec conformance for all entities
- [ ] Identifies gaps
- [ ] Produces remediation guidance
- [ ] Works in audit-only mode

## Status Note

Medium priority. Useful for systematic spec enforcement but not blocking.
