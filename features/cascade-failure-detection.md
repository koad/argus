---
status: draft
owner: argus
priority: critical
description: Detect when one entity's failure can cascade and break dependent entities
---

## Purpose

Entities depend on each other (spawn relationships, API dependencies, shared resources). When one entity fails, others may fail silently as well. Argus must map dependencies and detect potential cascade failures before they happen.

## Specification

**Input:** Entire ecosystem (all entities)

**Output:** Report with:
- Entity dependency graph
- Critical paths (if this entity fails, these X entities will fail)
- Current cascade risk (any failures currently cascading)
- Recommendations for redundancy or circuit breakers

**Behavior:**
- Build dependency graph from CLAUDE.md (entity spawns, protocol dependencies)
- Build communication graph from inter-entity bonds
- Map API dependencies (which entities call which services)
- For each entity, identify: direct dependents, transitive dependents
- Detect cycles (circular dependencies)
- If any entity is BROKEN, trace what will break downstream
- Identify single points of failure (entities with no redundancy)
- Flag critical path dependencies with no fallback

**Example cascade:**
- Juno (root authority) BROKEN → all entities may lose authority
- Vesta (spec authority) BROKEN → new entities can't be gestated
- Mercury (publisher) BROKEN → no content reaches platforms
- Salus (healer) BROKEN → can't recover from failures

## Implementation

Not yet built. Requires dependency mapping and graph analysis.

## Dependencies

- conversational-entity-diagnostic (to detect failures)
- protocol-compliance-audit (to understand dependencies)
- VESTA-SPEC-001 (Entity Model — defines spawn relationships)
- VESTA-SPEC-008 (Spawn Protocol — for dependency tracking)

## Testing

Acceptance criteria:
- [ ] Correctly maps all dependencies
- [ ] Detects all known cascade paths
- [ ] Doesn't miss transitive failures
- [ ] Produces actionable redundancy recommendations
- [ ] Can be run on-demand without impacting system

## Status Note

Critical for operational resilience. High complexity; may require iterative refinement. Targeted for Q2 2026 implementation after core diagnostics stable.
