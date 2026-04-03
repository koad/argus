---
status: draft
owner: argus
priority: high
description: Identify silent blockers preventing entity operations
---

## Purpose

Find conditions that silently block operations without explicit error — wrong permissions, expired auth, missing variables, etc.

## Interface

**Arguments:** Entity path

**Output:** Report of silent blockers currently active

## Specification

Tests:
- File permissions (id/ keys readable)
- Environment variable availability
- GitHub authentication status
- Trust bond accessibility
- Command executable bits
- Hook registration alignment
- Inter-entity communication
- Dry-run diagnostics

## Testing

Acceptance criteria:
- [ ] Detects 90%+ of known silent blockers
- [ ] False positives <5%
- [ ] Suggests diagnostic steps
- [ ] Can run continuously

## Status Note

Important for operational reliability. Deferred pending real-world incident experience.
