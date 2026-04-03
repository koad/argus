---
status: draft
owner: argus
priority: medium
description: Identify work items in gate logs with no corresponding published content
---

## Purpose

Mercury maintains a publish log. Some entries may be work that was gated (held or stopped) but never completed and re-published. Argus must identify these orphaned items — work that started but wasn't finished, which could mislead observers about what was actually published.

## Specification

**Input:** Mercury publish log (reports/mercury-publish-log.md)

**Output:** Report of:
- Gated work with STOP status that was never republished
- Work in HOLD status still pending 30+ days
- Content drafts in Mercury pipeline with no corresponding gate log entry
- Recommended follow-up actions

**Behavior:**
- Parse mercury-publish-log.md for all entries
- Identify entries with status=STOP
- Check Mercury pipeline for re-publication of stopped work
- If not republished within reasonable window (30 days), flag as orphaned
- Check for work in Mercury draft status with no gate log entry
- Generate report with remediation (delete orphaned draft, republish, or close issue)

## Implementation

Not yet built. Depends on Mercury pipeline integration.

## Dependencies

- Mercury entity (publish log and pipeline)
- GitHub Issues API (check linked issues)
- VESTA-SPEC-013 (Features-as-Deliverables — gate logs are features)

## Testing

Acceptance criteria:
- [ ] Identifies all orphaned work within 30-day window
- [ ] Doesn't flag legitimately long-duration work
- [ ] Provides clear remediation steps
- [ ] Can be run weekly or on-demand

## Status Note

Low-medium priority. Quality-of-life feature for operations. Useful after gate process stabilizes.
