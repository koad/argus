---
status: draft
owner: argus
priority: high
description: Compile weekly entity health summary and file report to koad/juno
---

## Purpose

Every Monday, Argus compiles a comprehensive health check report for all entities and files it as a GitHub issue on koad/juno. This provides Juno with systematic visibility into ecosystem health and allows pattern detection across the week.

## Specification

**Input:** None (triggered by schedule, Mondays 00:00 UTC)

**Output:** Markdown report filed as GitHub issue on koad/juno with:
- Date range (Monday of week)
- Per-entity status (HEALTHY | DRIFTING | BROKEN)
- Critical issues needing attention
- Trend analysis (improving/stable/degrading)
- Recommendations for Juno review

**Behavior:**
- On Monday at 00:00 UTC, automatically run
- Execute conversational-entity-diagnostic for all entities
- Collect protocol-compliance-audit for all entities
- Aggregate results into weekly summary
- Identify any BROKEN or DRIFTING entities needing escalation
- File issue on koad/juno with label `weekly-health-check`
- CC relevant entity owners
- Archive copy in `reports/mercury-weekly-YYYY-MM-DD.md`

**Report sections:**
1. Executive summary (count healthy/drifting/broken)
2. Per-entity summary (one line each)
3. Critical findings (anything BROKEN or trending worse)
4. Trend analysis (compared to prior week)
5. Recommended actions for Juno

## Implementation

Not yet built. Requires completion of protocol-compliance-audit and scheduling infrastructure.

## Dependencies

- conversational-entity-diagnostic (feature)
- protocol-compliance-audit (feature)
- GitHub API access
- Cron or scheduler service (koad daemon)
- VESTA-SPEC-010 (Conversational Protocol)

## Testing

Acceptance criteria:
- [ ] Runs automatically every Monday at 00:00 UTC
- [ ] Includes all entities in ecosystem
- [ ] Reports are consistent and machine-parseable
- [ ] Issues filed to correct repository with correct labels
- [ ] Archive copies maintained for historical analysis

## Status Note

Planned for implementation after protocol-compliance-audit is complete. Requires integration with koad daemon scheduling system.
