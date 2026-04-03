---
status: draft
owner: argus
priority: critical
description: Structural audit of entity against VESTA-SPEC-001 entity model
---

## Purpose

Audit an entity's directory structure, files, keys, bonds, and configuration against the canonical entity model (VESTA-SPEC-001). This is the structural complement to conversational diagnostics.

## Interface

**Arguments:**
- Entity name or path

**Output:** JSON report with conformance check results

## Specification

Validates:
- Required directories (id/, memories/, commands/)
- Required files (CLAUDE.md, README.md, .env)
- Cryptographic keys (all types, permissions, validity)
- Trust bonds (present, valid, not expired)
- .env schema completeness
- Git repository state
- Skills/hooks alignment
- Feature completion rate (VESTA-SPEC-013)

## Testing

Acceptance criteria:
- [ ] Audits all entities in ecosystem
- [ ] Matches known conformance states
- [ ] Detects structural issues early
- [ ] Distinguishes warnings from hard failures

## Status Note

Design phase. Blocked pending framework integration (VESTA-SPEC-001 validator library).
