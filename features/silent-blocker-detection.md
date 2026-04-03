---
status: draft
owner: argus
priority: high
description: Identify conditions that silently block entity operations without explicit error
---

## Purpose

Some failures are silent — operations complete but produce wrong or partial results, with no error message. Examples: keys not readable, bonds not accessible, GitHub auth failing silently, environment variables unset. Argus must detect these silent blockers that prevent effective operation.

## Specification

**Input:** Entity directory path

**Output:** Report identifying:
- Silent blockers currently active
- Operations likely affected
- Severity (entity unusable | degraded | minor impact)

**Behavior:**
- Check file permissions (id/ keys readable, writable)
- Verify environment variable availability (not null)
- Test GitHub authentication (gh auth status)
- Verify trust bonds are accessible (readable, valid)
- Check that commands/ has executable bits set
- Verify hook registration matches capabilities
- Test inter-entity communication (can reach other entities)
- Dry-run diagnostic commands to catch failures early

**Example silent blockers:**
- Key files exist but aren't readable (permissions 600 but wrong owner)
- GitHub token expired but no explicit error until push
- CLAUDE.md references undefined variables in hooks
- Entity spawned child but child has missing .env
- Git remote configured but authentication unreliable

## Implementation

Not yet built. Requires understanding of entity failure modes.

## Dependencies

- VESTA-SPEC-001 (Entity Model) — for expected state
- Protocol-compliance-audit (feature) — for structural checks
- Entity-specific knowledge (how each entity fails silently)

## Testing

Acceptance criteria:
- [ ] Detects 90%+ of known silent blockers
- [ ] Produces false positives <5%
- [ ] Suggests diagnostic steps for each blocker
- [ ] Can be run continuously without side effects

## Status Note

Important for operational reliability. Deferred pending lessons learned from real operational incidents.
