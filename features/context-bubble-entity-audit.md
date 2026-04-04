---
status: draft
owner: argus
priority: high
description: Audit entity behavior vs. declared spec conformance using context bubbles as session record
started: 2026-04-03
---

## Purpose

Context bubbles (VESTA-SPEC-016) create a verifiable, indexed record of how an entity behaves during sessions. Argus can now audit entity conformance to declared specs by replaying bubbles from recent sessions and checking whether actual behavior matches spec requirements.

**Use case:** "Entity claims to implement VESTA-SPEC-006. Show me the last 5 sessions where this entity was invoked. Does the recorded behavior match the spec?"

This moves auditing from *document inspection* to *behavior playback* — the authoritative record is the context bubble, not a CLAUDE.md claim.

## Specification

**Input:** Entity name, spec version (e.g., "vesta", "VESTA-SPEC-006")

**Output:** Conformance report with:
- Context bubbles found for entity in spec domain
- Behavior playback: what the entity actually did (extracted from bubble moments)
- Spec requirement: what the spec requires
- Conformance status: PASS | WARN | FAIL
- Drift or contradiction detected

**Behavior:**
- Query bubble registry for bubbles created by or referencing the entity
- Filter bubbles by topic (spec domain — e.g., "daemon-specification", "entity-model")
- Load each bubble and extract moments
- For each moment in the bubble:
  - Classify as input/discovery/hypothesis/test/failure/correction/conclusion
  - Compare against spec requirements
  - Flag deviations or contradictions
- Aggregate conformance status across all moments
- Generate report with citations to specific moment hashes (verifiable)

**Edge cases:**
- Partial implementations (spec version marked "partial" in entity CLAUDE.md)
- Experimental specs (draft status) — audit against draft requirements only
- No bubbles available for entity — mark as "unauditable", recommend creating bubbles
- Bubbles from before spec was published — skip (not applicable)
- Spec revision mismatch — audit against highest available revision

## Implementation

Not yet built. Design phase complete.

**Key integration points:**
- Bubble registry query (VESTA-SPEC-016 bubble storage)
- Spec version loader (from ~/.vesta/specs/)
- Moment classifier (context_type from bubble schema)
- Behavior extractor (transcript segment from moment)

## Dependencies

- VESTA-SPEC-016 (Context Bubble Protocol)
- VESTA-SPEC-001 (Entity Model)
- Context bubble files from entity directories (~/{entity}/bubbles/)
- Spec library at ~/.vesta/specs/

## Testing

Acceptance criteria:
- [ ] Can load and parse context bubbles for any entity
- [ ] Moment extraction works across multiple sessions
- [ ] Spec requirement parsing works for all VESTA specs
- [ ] Behavior playback is readable and verifiable
- [ ] Conformance detection catches spec drift
- [ ] Moment hashes are included in report (verifiable)
- [ ] Can be run in audit-only mode (no changes)

## Status Note

High priority. Enables first-class behavior auditing based on session records (bubbles) rather than claims (documentation). Part of Argus's core diagnostic mandate.
