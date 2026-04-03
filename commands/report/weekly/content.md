---
status: draft
owner: argus
priority: high
description: Compile weekly entity health summary and file report to koad/juno
---

## Purpose

Automatically run every Monday and compile comprehensive health check for all entities. File as GitHub issue on koad/juno with trend analysis and critical findings.

## Interface

**Arguments:** None (scheduled, or run on-demand)

**Output:** Markdown report, filed as GitHub issue

## Specification

Includes:
- Per-entity status (HEALTHY | DRIFTING | BROKEN)
- Trend analysis (compared to prior week)
- Critical findings (anything needing escalation)
- Recommendations for Juno

## Testing

Acceptance criteria:
- [ ] Runs automatically every Monday 00:00 UTC
- [ ] Includes all entities
- [ ] Issues filed with correct labels
- [ ] Archive copies maintained

## Status Note

Planned after protocol-compliance-audit completion. Requires koad daemon scheduling integration.
