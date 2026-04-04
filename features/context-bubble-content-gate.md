---
status: draft
owner: argus
priority: critical
description: Gate Mercury content claims by tracing them to verifiable context bubbles
started: 2026-04-03
---

## Purpose

Mercury's content pipeline makes claims — about features, progress, incidents, etc. Before those claims reach OpenClaw, Argus must verify that each claim is **traceable** to a context bubble where the claim was formed or validated.

A claim without a bubble is **unverifiable**. Veritas fact-checks claims, but context bubbles answer: "Where did this claim come from? Show me the thinking."

**Use case:** Mercury submits a post claiming "Daemon X now supports Y feature." Argus checks: Is there a context bubble from Vulcan or Vesta documenting when feature Y was designed, tested, and validated? Is the claim's scope accurate to what's in the bubble?

This is an extension of the existing Mercury gate (memories/003-mercury-gate.md). The new layer adds **claim traceability** to the existing checklist.

## Specification

**Input:** Mercury publish request (metadata, content, publish schedule)

**Output:** Enhanced GO | STOP | HOLD decision with traceability verdict

**Behavior:**

1. **Extract claims** — Parse Mercury content for factual statements that could affect user decisions:
   - Feature announcements ("Feature X is now available")
   - Status updates ("Bug Y is fixed")
   - Performance/capability changes ("Now supports Z")
   - Incident announcements ("Incident was cause by A")
   - Deadlines or commitments ("Will ship by date D")

2. **Trace each claim to bubbles:**
   - Query bubble registry for context bubbles from relevant entities (Vulcan, Vesta, etc.)
   - Search bubbles by topic/tag matching claim domain
   - Look for moments where the claim was formed, tested, or validated
   - Extract moment hash and session reference

3. **Verify claim scope:**
   - Does the claim match the scope of the bubble? (not overstated)
   - Was the claim tested? (is there a "test" or "correction" moment?)
   - Are there contradictions or caveats in the bubble? (e.g., "works on Platform A but not B")

4. **Gate decision:**
   - **GO:** All claims are traceable; scopes match; no contradictions.
   - **STOP:** Claim cannot be traced to any bubble; claim scope exceeds bubble evidence; contradictions detected.
   - **HOLD:** Bubble exists but is draft/unsigned; claim is newer than available bubbles; Veritas review pending.

5. **Log decision:**
   - Record claim → bubble trace in `reports/mercury-publish-log.md`
   - Include moment hashes (verifiable)
   - If STOP, file GitHub issue on koad/mercury with:
     - Which claim failed traceability
     - The missing or contradicting bubble evidence
     - Label: `guardrails-stop-unverifiable`

## Implementation

Partially implemented via existing Mercury gate. Enhancement required:

**Current implementation:**
- Mercury gate protocol documented (memories/003-mercury-gate.md)
- GO/STOP/HOLD decision tree implemented
- Publish log maintained

**New components needed:**
- Claim extraction from Mercury content (regex/NLP)
- Bubble registry query API
- Moment hash verification
- Claim-scope comparison logic
- Extended logging format (claim → bubble trace)

## Integration with Existing Gate

This is **not a replacement** for the existing Mercury gate checklist (schedule compliance, stop blocks, pipeline check, hard stop check). It is an **additional layer**.

Current gate flow:
```
Mercury → Schedule check → Stop blocks → Pipeline check → Hard stop → GO/STOP/HOLD
```

Enhanced flow:
```
Mercury → [Current checks] → Traceability check (context bubble verification) → GO/STOP/HOLD
```

## Dependencies

- VESTA-SPEC-016 (Context Bubble Protocol)
- Existing Mercury gate (memories/003-mercury-gate.md)
- Veritas fact-check system
- Bubble registry from entity directories
- Spec library for domain classification

## Testing

Acceptance criteria:
- [ ] Claims are extracted from Mercury content with >95% accuracy
- [ ] Claim traces to bubble succeed for claims with verifiable sources
- [ ] Claim traces fail gracefully when no bubble exists
- [ ] Claim scope is compared against bubble scope correctly
- [ ] Contradictions in bubbles are flagged (e.g., "fixed on X, not Y")
- [ ] Moment hashes are included in gate log (verifiable)
- [ ] STOP decisions cite missing bubble and suggest remediation path
- [ ] All publishes are logged with traceability verdict

## Status Note

Critical standing assignment. Extends existing Mercury gate to require context bubble traceability. Implementation targeted for 2026-04-15. Currently blocking on claim extraction heuristics and bubble registry API clarification.
