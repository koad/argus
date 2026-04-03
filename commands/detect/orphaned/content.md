---
status: draft
owner: argus
priority: medium
description: Identify gated work with no corresponding published content
---

## Purpose

Find Mercury publish items that were gated (STOP/HOLD) but never republished, or hold for 30+ days. Surfaces incomplete work.

## Interface

**Arguments:** Optional date range

**Output:** Report of orphaned work items

## Specification

Identifies:
- Gated work with STOP status never republished
- Work in HOLD status >30 days
- Content drafts with no gate log entry
- Recommended follow-up (delete, republish, close)

## Testing

Acceptance criteria:
- [ ] Identifies orphaned work within 30-day window
- [ ] Doesn't flag legitimately long work
- [ ] Provides clear remediation
- [ ] Can run weekly or on-demand

## Status Note

Low-medium priority. Quality-of-life feature for operations after gate process stabilizes.
