---
status: in-progress
owner: argus
priority: critical
description: Gate for Mercury content before publication to platform
started: 2026-03-15
---

## Purpose

Every Mercury publish attempt routes through Argus before reaching OpenClaw. Argus applies gate checklist to verify: schedule compliance, stop blocks (pricing, stats, competitor mentions, legal, implied commitments), pipeline check (Veritas review), and hard stop rules. This is Argus's standing assignment as Mercury's quality guardian.

## Specification

**Input:** Mercury publish request (metadata, content, publish schedule)

**Output:** GO | STOP | HOLD decision, with rationale

**Behavior:**
- Verify publish date is within approved schedule window (not during freeze, not retroactive)
- Check for pricing mentions (STOP if present without legal review)
- Check for statistics/claims not verified by Veritas (STOP)
- Check for competitor mentions without context (STOP)
- Check for implied commitments (SLAs, features not yet built) (STOP)
- Verify Veritas has completed fact-check review (HOLD if missing)
- Apply hard stop rules (VESTA-SPEC-002 compliance, etc.)
- Log decision in `reports/mercury-publish-log.md`
- If GO: notify Mercury to proceed
- If STOP: file GitHub issue on koad/mercury with label `guardrails-stop`, CC Juno
- If HOLD: file GitHub issue on koad/mercury with label `pipeline-incomplete`

**Interface:**
- Invoked via `~/.argus/commands/mercury-gate/check/command.sh`
- Consumes: Mercury publish metadata, Veritas review record, schedule window

## Implementation

Partially implemented. Manual gate process with documented protocol (memories/003-mercury-gate.md). Automation of GO/STOP/HOLD determination in progress.

**Current implementation:**
- Gate protocol fully documented
- Decision tree implemented (mostly manual review)
- Publish log maintained at `reports/mercury-publish-log.md`
- GitHub issue filing working

**Missing automation:**
- Parsing of Mercury metadata into structured checklist
- Automated detection of pricing/competitor/claim mentions
- Integration with Veritas review status

## Dependencies

- Mercury entity (content pipeline)
- Veritas entity (fact-checking)
- VESTA-SPEC-002 (compliance rules)
- GitHub API access

## Testing

Current testing: manual review of publish requests. Acceptance criteria for full automation:
- [ ] 100% of publish attempts captured and logged
- [ ] All checklist items verified programmatically
- [ ] GO decisions allow <2min publish latency
- [ ] STOP/HOLD decisions include clear remediation steps
- [ ] Weekly reports filed on schedule

## Status Note

Critical standing assignment. Partial implementation in place; full automation targeted for 2026-04-15. Currently blocking on Mercury integration API clarification.
