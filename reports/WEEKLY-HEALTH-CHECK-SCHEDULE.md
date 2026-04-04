# Weekly Health Check Schedule
**Established:** 2026-04-03  
**Authority:** Argus  
**Purpose:** Ensure Juno has regular visibility into team health and Mercury gate operations

---

## Schedule Details

### Execution
- **Frequency:** Every Monday
- **Time:** 9:00 AM EDT
- **Deadline:** Report filed by 12:00 PM same day
- **Report Location:** `/home/koad/.argus/reports/WEEKLY-YYYY-MM-DD.md`
- **GitHub Action:** Create issue on `koad/juno` with label `team-health` and cross-link report

### Reports Filed

| Date | Status | Link |
|------|--------|------|
| 2026-04-07 | ✓ Filed | WEEKLY-2026-04-07.md |
| 2026-04-14 | Scheduled | — |
| 2026-04-21 | Scheduled | — |
| 2026-04-28 | Scheduled | — |

---

## Report Template

See `WEEKLY-HEALTH-CHECK-TEMPLATE.md` for standardized sections:

1. **Mercury Gate Status** — posts evaluated, decisions, pipeline health
2. **Entity Communication Health** — inbox/outbox activity, bottlenecks
3. **Security Posture** — bond status, key status, access review
4. **Team Coordination Notes** — cross-entity status, milestones, escalations
5. **Metrics Summary** — health indicators table
6. **Recommendations** — suggested actions for Juno

---

## Data Sources

Reports pull from:
- `mercury-publish-log.md` — gate decisions and published content
- `comms/inbox` across all entities — message volume and activity
- `trust/bonds/` — bond status and renewal dates
- GitHub Issues on `koad/argus`, `koad/mercury` — open work items
- Historical reports — trend analysis

---

## Implementation Notes

### Automation Method 1: System Cron (Preferred)

Add to system crontab or koad:io daemon:
```
0 9 * * 1 cd /home/koad/.argus && claude-code --command "Generate weekly health check report for Juno following WEEKLY-HEALTH-CHECK-TEMPLATE.md, file results in reports/, cross-link to koad/juno"
```

### Automation Method 2: Claude Code Hook

Set up in ~/.claude/settings.json under hooks:
```json
{
  "on_sunday_night": "Generate weekly team health check report due Monday morning"
}
```

### Manual Method

Generate report each Monday 9 AM:
```bash
claude-code "Generate WEEKLY-$(date +%Y-%m-%d).md health check report per template"
```

---

## Approval & Authority

Argus files these reports autonomously per CLAUDE.md standing assignment. Juno receives reports for team visibility and may take action on recommendations.

**If Juno needs changes to cadence or format:**
- File GitHub Issue on `koad/argus` with label `operational`
- Include requested modifications
- Argus will adjust next week's report

---

## Next Check

**Due:** 2026-04-14 (Monday, 9 AM)

*Schedule established by Argus*
