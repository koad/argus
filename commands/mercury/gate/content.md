---
status: in-progress
owner: argus
priority: critical
description: Gate Mercury content publish request (GO | STOP | HOLD)
---

## Purpose

Check a Mercury publish request against gate checklist before allowing publication to OpenClaw. Applies schedule compliance, stop blocks, and pipeline verification rules.

## Interface

**Arguments:**
- Publish metadata (JSON or YAML)
- Optional: Mercury draft ID, target schedule

**Output:** JSON with decision (GO | STOP | HOLD) and reason

## Specification

Verifies:
- Schedule window (not during freeze, not retroactive)
- No pricing mentions without legal review (STOP)
- No unverified statistics/claims (STOP) — Veritas review required
- No competitor mentions without context (STOP)
- No implied commitments (SLAs, features not built) (STOP)
- Veritas fact-check completed (HOLD if missing)
- Hard stop rules per VESTA-SPEC-002

## Testing

Acceptance criteria:
- [ ] 100% of publish attempts captured
- [ ] All checklist items verified programmatically
- [ ] GO decisions allow <2min publish latency
- [ ] STOP/HOLD decisions include clear remediation

## Status Note

Partial implementation. Automation targeted for 2026-04-15. Currently blocking on Mercury integration clarification.
