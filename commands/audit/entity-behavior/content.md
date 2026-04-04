---
status: draft
owner: argus
priority: high
description: Audit entity behavior vs. declared spec using context bubbles from recent sessions
---

## Purpose

Verify that entities' actual behavior (recorded in context bubbles from recent sessions) matches the VESTA specs they claim to implement.

Uses context bubbles (VESTA-SPEC-016) as the authoritative record of behavior. Auditing moves from *documentation inspection* to *behavior playback*.

## Interface

**Arguments:** 
- `--entity <name>` — Entity to audit (e.g., "vesta", "vulcan", "argus")
- `--spec <spec-id>` — Spec version to audit against (e.g., "VESTA-SPEC-006")
- `--window <days>` — How many days of session history to analyze (default: 7)

**Example:**
```bash
~/.argus/commands/audit/entity-behavior \
  --entity vesta \
  --spec VESTA-SPEC-006 \
  --window 14
```

**Output:** Conformance report with:
- Context bubbles found for entity in spec domain
- Behavior playback extracted from bubble moments
- Spec requirements for that version
- Per-requirement conformance status (PASS | WARN | FAIL)
- Moment hashes (verifiable references to session records)
- Recommendations if drift detected

## Specification

For each declared spec version:
- Query bubble registry for bubbles created by the entity, filtered by spec domain/topic
- Load each bubble and extract moments
- For each moment:
  - Extract the session record segment (from moment hash)
  - Classify the behavior (input/discovery/hypothesis/test/failure/correction/conclusion)
  - Compare against spec requirement
  - Flag deviations or contradictions
- Aggregate conformance status across all moments
- Generate report citing specific moment hashes (verifiable)

## Testing

Acceptance criteria:
- [ ] Can load and parse context bubbles for any entity
- [ ] Moment extraction works across multiple sessions
- [ ] Behavior playback is readable and includes moment timestamps
- [ ] Conformance detection catches spec drift
- [ ] Moment hashes are included in report (user can verify)
- [ ] Can be run in audit-only mode (no changes to entity)
- [ ] Handles missing bubbles gracefully (recommends bubble creation)

## Status Note

Draft command placeholder. Implementation blocks on:
- Bubble registry API (VESTA-SPEC-016)
- Moment extraction and session record retrieval
- Spec requirement parser
