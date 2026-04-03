---
status: complete
owner: argus
priority: critical
description: Conversational behavioral audit of entity health via four diagnostic probes
completed: 2026-04-01
---

## Purpose

Argus must be able to invoke any entity and assess its behavioral health through a conversational diagnostic protocol. This determines whether an entity is HEALTHY, DRIFTING, or BROKEN based on responses to identity, role, protocol, and trust questions.

## Specification

**Input:** Entity name (string)

**Output:** Markdown diagnostic report with:
- Overall health state (HEALTHY | DRIFTING | BROKEN)
- Per-probe scores (identity, role, protocol, trust)
- Pass/warn/fail counts
- Captured responses
- Recommendation for action

**Behavior:**
- Invoke target entity with four probe sets (identity, role, protocol, trust)
- Collect and score responses (PASS/WARN/FAIL per question)
- Calculate percentage score per probe
- Derive health state from percentage (≥80% HEALTHY, ≥60% DRIFTING, <60% BROKEN)
- Adjust overall state: if any probe is BROKEN, overall is BROKEN; if 3+ probes DRIFTING and <80%, overall DRIFTING
- Save diagnostic report to `~/.argus/diagnoses/` with timestamp

**Interface:**
```bash
~/.argus/commands/diagnose/entity/command.sh <entity-name>
```

## Implementation

Implemented in `~/.argus/commands/diagnose/entity/command.sh`. Fully compliant with VESTA-SPEC-010 Conversational Entity Diagnostic Protocol.

## Dependencies

- VESTA-SPEC-010 (Conversational Entity Diagnostic Protocol) — canonical
- Entity being diagnosed must be accessible via `juno invoke`

## Testing

Tested against all core entities (aegis, mercury, sibyl) on 2026-04-01. All probes executed successfully, reports generated and filed correctly.

## Status Note

Production-ready. In active use as primary entity health assessment tool.
