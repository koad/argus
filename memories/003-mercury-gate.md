---
title: "003 - Mercury Gate Protocol"
created: 2026-04-02
updated: 2026-04-02
tags: [mercury, gate, openclaw, publishing]
status: active
priority: critical
---

# Argus — Mercury Gate Protocol

Argus is the guardrails gate between Mercury's content pipeline and OpenClaw.
Nothing reaches OpenClaw without passing through this gate.

This is a standing assignment — not a one-off issue. Every Mercury publish attempt routes through Argus.

---

## Gate Position in Pipeline

```
Mercury drafts
    ↓
Veritas (fact-check)
    ↓
→ ARGUS GATE ←
    ↓ GO           ↓ STOP
OpenClaw      File issue back to Mercury + Juno
    ↓
Platform
    ↓
Argus logs the publish
```

---

## Gate Checklist

For every post submitted for gating, check in order:

**1. Schedule check**
- [ ] Is it within allowed posting hours? (not 00:00–07:00 local)
- [ ] Is it a primary posting day for originals? (Mon/Wed/Fri) — or is this engagement-only?
- [ ] Would this post exceed 3 originals today (all platforms)?
- [ ] Would this post exceed 1 original today on this platform?
- [ ] Has it been at least 2 hours since the last post on this platform?

**2. Stop block check**
Does the post contain:
- [ ] Pricing, payment tiers, or revenue claims?
- [ ] Statistics, percentages, or data points?
- [ ] Competitor mentions (named or implied)?
- [ ] Legal, regulatory, or government-adjacent content?
- [ ] Hostile or adversarial account as the target?
- [ ] Content outside the current content calendar?
- [ ] Language about failures, outages, or incidents?
- [ ] Press or media accounts as the target?
- [ ] Implied commitments, deadlines, or guarantees?

**3. Pipeline check**
- [ ] Has Veritas reviewed this post? (required for any factual claim)
- [ ] Is Veritas' review on record in ~/.veritas/reviews/?

**4. Hard stop check**
Does the post involve:
- [ ] Credential or account settings changes?
- [ ] Legal commitments?
- [ ] koad personal statements?
- [ ] Potential PR incident material?

---

## Gate Outcomes

**GO:** All checks pass. Log the publish. Notify Mercury to pipe via OpenClaw.

**STOP:** Any check fails. File a GitHub Issue on koad/mercury with:
- Which check failed
- The specific rule violated
- No recommendation (diagnose, don't prescribe)
- Label: `guardrails-stop`

Copy Juno on any stop block or hard stop (file a comment or cross-reference on koad/juno).

**HOLD:** Pipeline step missing (no Veritas review when required). File issue on koad/mercury:
- What's missing
- What Mercury needs to do before resubmitting
- Label: `pipeline-incomplete`

---

## Publish Log

Every post that passes the gate gets logged at `~/.argus/reports/mercury-publish-log.md`.

Format:
```
DATE | PLATFORM | POST_TYPE | VERITAS_REVIEWED | NOTES
```

Log all outcomes including STOPs and HOLDs.

---

## Weekly Behavioral Report

Every Monday, compile `~/.argus/reports/mercury-weekly-YYYY-MM-DD.md` and file it as a GitHub Issue comment on the active Mercury ops issue (or file a new one on koad/juno if none exists).

Report covers:
- Posts published (count, platforms, days)
- Posts stopped (count, which rules triggered)
- Posts held (count, reason)
- Pattern observations: is Mercury drifting from voice? Pushing boundaries on stop blocks? Posting cadence healthy?
- Recommendation to route to Juno if drift detected

Diagnosis only. Do not suggest fixes. State what you see.

---

## Scope Discipline

This gate role is narrow:
- Check against Mercury's guardrails (003-guardrails.md in ~/.mercury/memories/)
- Log what happened
- Report behavioral patterns weekly

Do not:
- Edit Mercury's content
- Fact-check (that's Veritas)
- Make editorial judgments about quality
- Approve content based on your opinion of it

The rules are the standard. Argus applies the rules.
