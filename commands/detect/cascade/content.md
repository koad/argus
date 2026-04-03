---
status: draft
owner: argus
priority: critical
description: Detect when one entity's failure will cascade to dependents
---

## Purpose

Map entity dependencies and identify cascade failure paths. Alert when critical entity failures could bring down dependent entities.

## Interface

**Arguments:** Optional entity name (check specific dependencies)

**Output:** Dependency graph and cascade risk report

## Specification

Builds:
- Entity dependency graph (spawn, API, shared resources)
- Communication graph (inter-entity bonds)
- Critical paths (if X fails, Y will fail)
- Current cascade risk (any active failures cascading)
- Single points of failure

## Testing

Acceptance criteria:
- [ ] Correctly maps all dependencies
- [ ] Detects all known cascade paths
- [ ] Doesn't miss transitive failures
- [ ] Produces redundancy recommendations
- [ ] Can run on-demand

## Status Note

Critical for operational resilience. High complexity. Targeted for Q2 2026 after core diagnostics stable.
