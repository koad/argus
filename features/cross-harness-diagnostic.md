---
status: draft
owner: argus
priority: high
description: Audit state of multiple harnesses (~/.koad-io, ~/.vesta, ~/.salus, etc.)
---

## Purpose

Argus must be able to scan across the entire koad:io installation and report the health of all harnesses (framework layer and entity layer). This catches cascade failures and systemic issues that affect multiple entities.

## Specification

**Input:** None (scans entire home directory structure)

**Output:** Markdown report with:
- Framework layer status (KOAD_IO_VERSION, koad-io integrity)
- Per-entity status summary
- Cross-harness health metrics
- Dependency graph violations
- System-wide issues (orphaned processes, dangling symlinks, etc.)

**Behavior:**
- Scan ~/.koad-io for framework integrity
- List all entity directories (grep for .env with ENTITY variable)
- Run protocol-compliance-audit on each entity
- Check inter-entity trust bonds are complete
- Verify git remotes point to expected repositories
- Flag missing or corrupted state
- Aggregate into single report

**Edge cases:**
- New/experimental entities not yet registered
- Disabled entities (archived/ directory)
- Symlinked entities
- Entities with unusual ownership

## Implementation

Not yet built. Requires completion of protocol-compliance-audit.

## Dependencies

- protocol-compliance-audit (feature)
- VESTA-SPEC-001 (Entity Model)
- VESTA-SPEC-003 (Trust Bonds)

## Testing

Acceptance criteria:
- [ ] Correctly identifies all entities
- [ ] Detects structural issues across harness
- [ ] Reports on framework and entity layers
- [ ] Produces actionable diagnostics

## Status Note

Planned for implementation in next quarterly cycle. Depends on protocol-compliance-audit completion.
