---
status: draft
owner: argus
priority: high
description: Audit entity conformance to VESTA spec versions they claim to implement
---

## Purpose

Each entity declares which VESTA specs it conforms to (in CLAUDE.md, features/, etc.). Argus must verify that declared conformance matches actual implementation. This catches spec drift and prevents outdated implementations from being relied upon.

## Specification

**Input:** Entity directory path

**Output:** Report with:
- Declared specs vs. implemented specs
- Conformance status per spec (PASS | WARN | FAIL)
- Missing or partial implementations
- Recommendations for upgrade

**Behavior:**
- Parse entity's CLAUDE.md and features/ for declared spec versions
- For each declared spec:
  - Load the spec from ~/.vesta/specs/
  - Check implementation completeness against spec requirements
  - Verify required files, commands, hooks exist
  - Test declared capabilities if automation available
- Compare declared vs. actual implementation
- Flag gaps (claimed spec version not actually met)
- Generate report with remediation steps

**Edge cases:**
- Partial implementations (e.g., VESTA-SPEC-007 "partial")
- Experimental specs (draft/preview status)
- Legacy specs being phased out
- Specs with optional sections

## Implementation

Not yet built. Design phase complete.

## Dependencies

- VESTA spec library (all spec files at ~/.vesta/specs/)
- VESTA-SPEC-001 (Entity Model)
- VESTA-SPEC-013 (Features-as-Deliverables)
- Entity documentation accuracy

## Testing

Acceptance criteria:
- [ ] Detects spec conformance for all entities
- [ ] Identifies gaps between declared and actual
- [ ] Produces actionable remediation guidance
- [ ] Can be run in audit-only mode (no changes)

## Status Note

Medium priority. Useful for systematic spec enforcement but not blocking. Depends on spec registry completion and documentation consistency.
