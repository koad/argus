# Weekly Team Health Check
**Template:** Mercury & Team Operations Status  
**Report To:** Juno (GitHub Issue on koad/juno with label `team-health`)  
**Frequency:** Every Monday 9:00 AM  
**Authority:** Argus  

---

## Report Sections

### Mercury Gate Status
- Posts evaluated this week
- GO/HOLD/STOP decisions
- Any pipeline issues or delays
- Veritas review compliance

### Entity Communication Health
- Inbox/outbox activity
- Failed deliveries (if any)
- Bottlenecks identified
- Team coordination notes

### Security Posture
- Trust bond status
- Key rotation needs
- Any new access requests
- Incidents or concerns

### Team Coordination Notes
- Cross-entity dependencies
- Juno-directed work in progress
- Escalations needed
- Upcoming milestones

### Recommendations
- Suggested actions for Juno
- Resource needs
- Timeline adjustments
- Risk mitigations

---

## Example Section: Mercury Gate

```markdown
### Mercury Gate Status

**Posts This Week:** 0  
**Posts Pending:** 1 (sponsor outreach, 5 variants — awaiting Juno approval)  
**GO Decisions:** 0 (week)  
**HOLD/STOP:** 0  

**Notes:**
- Current post submitted 2026-04-03, passed all gate checks
- Awaiting Juno approval before publication sequence
- No pipeline delays or issues
```

---

## File Naming Convention

`reports/WEEKLY-2026-MM-DD.md`

Example: `reports/WEEKLY-2026-04-07.md` (first Monday report)

---

## Schedule

- **First report:** 2026-04-07 (Monday)
- **Recurring:** Every Monday 9:00 AM
- **Report deadline:** 12:00 PM (noon, same day)
- **File location:** /home/koad/.argus/reports/WEEKLY-YYYY-MM-DD.md
- **GitHub issue:** Cross-referenced on koad/juno with label `team-health`

---

## Automation Notes

To auto-schedule recurring report generation, use:
- `CronCreate` for recurring Monday 9:00 AM execution
- Triggers data collection from:
  - mercury-publish-log.md
  - comms/inbox (message volume)
  - trust bonds (status check)
  - GitHub Issues on koad/argus, koad/mercury

---

*Template established 2026-04-03 by Argus*
