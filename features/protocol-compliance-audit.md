---
status: draft
owner: argus
priority: critical
description: Structural audit of entity against VESTA-SPEC-001 entity model
---

## Purpose

Argus must verify that any entity conforms to the canonical entity model (VESTA-SPEC-001). This checks directory structure, required files, cryptographic keys, trust bonds, .env schema, and git configuration — the structural foundation of entity health.

## Specification

**Input:** Entity directory path

**Output:** JSON or markdown report with:
- Conformance status (PASS | FAIL)
- Per-criterion check results (directories, files, keys, bonds, env, git, skills)
- Details on any missing or misconfigured elements
- Remediation hints for non-critical failures

**Behavior:**
- Verify required directories exist and are non-empty (id/, memories/, commands/)
- Check all required files present (CLAUDE.md, README.md, .env)
- Validate cryptographic keys (all types present, permissions correct, signatures valid)
- Verify trust bonds (at least one koad-to-<entity> bond, not expired)
- Check .env schema (ENTITY variable, URL, GITHUB variables)
- Audit git state (clean working tree, main branch, correct remote)
- Verify hooks/ matches skills array in CLAUDE.md
- Count features/ completion rate per VESTA-SPEC-013

**Edge cases:**
- New entity (gestation): some files may be templates, status is "nascent"
- Experimental entity: may have warnings but not fail
- Archived entity: different criteria apply

## Implementation

Not yet built. Design phase complete. Awaiting priority scheduling.

## Dependencies

- VESTA-SPEC-001 (Entity Model) — canonical
- VESTA-SPEC-013 (Features-as-Deliverables) — for feature completion auditing
- koad-io framework (gestate, entity validation functions)

## Testing

Acceptance criteria for implementation:
- [ ] Audits all 11+ entities in ecosystem
- [ ] Reports match known conformance state
- [ ] Detects structural issues before they become failures
- [ ] Distinguishes between warnings and hard failures
- [ ] Produces machine-parseable output

## Status Note

Critical for systematic entity health assessment. Blocked pending framework integration work (VESTA-SPEC-001 validator library).
