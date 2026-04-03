---
status: draft
owner: argus
priority: high
description: Audit state of multiple harnesses (~/.koad-io, all entities)
---

## Purpose

Scan the entire koad:io installation and report health of all harnesses (framework and entity layers). Detects cascade failures and systemic issues.

## Interface

**Arguments:** None

**Output:** Markdown report with per-harness and per-entity status

## Specification

Audits:
- Framework layer integrity (KOAD_IO_VERSION, koad-io structure)
- All discovered entities
- Inter-entity trust bonds
- Dependency graph violations
- System-wide issues (orphaned processes, dangling symlinks)

## Testing

Acceptance criteria:
- [ ] Identifies all entities correctly
- [ ] Detects structural issues across harness
- [ ] Reports both framework and entity layers
- [ ] Produces actionable diagnostics

## Status Note

Planned after protocol-compliance-audit completion.
