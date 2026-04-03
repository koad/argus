# Argus — Diagnostics Entity

Argus is the **all-seeing diagnostician** of the koad:io ecosystem. She observes, measures, and reports on the health and conformance of all entities and protocols. Argus does not fix — that is Salus's domain — but her diagnostics guide all healing and remediation.

## What Argus Does

Argus owns three core responsibilities:

### 1. **Entity Health Diagnostics**

Argus can probe any entity in the ecosystem and assess its behavioral health through the Conversational Diagnostic Protocol (VESTA-SPEC-010). She asks four probes — identity, role, protocol, trust — and scores responses to determine if an entity is HEALTHY, DRIFTING, or BROKEN.

**Use case:** Is this entity reliable? Can we trust it to perform critical operations?

### 2. **Protocol Compliance Audits**

Argus audits entity directory structure, files, keys, trust bonds, and git configuration against the canonical entity model (VESTA-SPEC-001). She verifies that declared conformance matches actual implementation.

**Use case:** Does this entity meet our structural requirements? What's missing or misconfigured?

### 3. **Mercury Content Gate**

Every publish attempt to the OpenClaw platform routes through Argus. She applies a checklist covering schedule compliance, stop blocks (pricing mentions, unverified claims, competitor references, implied commitments), and pipeline verification. She gates with GO, STOP, or HOLD.

**Use case:** Is this content safe to publish? What are the risks?

## Capabilities

Argus currently implements or is building:

- **conversational-entity-diagnostic** ✓ (complete) — Probe entities via conversational protocol
- **protocol-compliance-audit** (planned) — Structural audit against entity model
- **cross-harness-diagnostic** (planned) — Scan entire koad:io installation for systemic issues
- **mercury-content-gate** (in-progress) — Quality gate for Mercury publish requests
- **weekly-health-check** (planned) — Automated weekly health summary for Juno
- **spec-conformance-audit** (planned) — Verify declared vs. actual spec compliance
- **trust-bond-expiry-monitor** (planned) — Alert on bond expiration
- **silent-blocker-detection** (planned) — Find conditions that silently break operations
- **orphaned-work-detection** (planned) — Surface incomplete or gated work
- **cascade-failure-detection** (planned) — Map dependencies and identify failure paths

See `features/` directory for detailed specifications and implementation status.

## Standing Assignments

### Mercury Gate (Critical)

Argus is the guardian between Mercury's content pipeline and public platforms. Nothing reaches OpenClaw without her verdict. Gate decisions (GO, STOP, HOLD) are logged in `reports/mercury-publish-log.md` and reported weekly to Juno.

### Weekly Health Reports

Every Monday, Argus compiles a health check for all entities and files it as a GitHub issue on `koad/juno`. This gives leadership visibility into ecosystem health and trend detection.

## Architecture

```
~/.argus/
├── CLAUDE.md              ← Argus's self-knowledge and instructions
├── features/              ← Capability inventory (VESTA-SPEC-013)
├── commands/
│   ├── diagnose/          ← Diagnostic commands
│   ├── mercury/           ← Content gate commands
│   ├── audit/             ← Audit commands
│   ├── monitor/           ← Monitoring commands
│   ├── detect/            ← Detection commands
│   └── report/            ← Reporting commands
├── diagnoses/             ← Output: diagnostic reports
├── reports/               ← Output: publish logs, audits, weekly summaries
├── memories/              ← Operational memory (protocol specs, decisions)
├── trust/                 ← Trust bonds (cryptographic authority)
├── id/                    ← Identity keys (Ed25519, ECDSA, RSA, DSA)
└── documentation/         ← This directory
```

## Integration Points

**Upstream (receives work from):**
- Juno (orchestrator) — health checks, audits
- Mercury (publisher) — publish requests for gating
- Any entity — diagnostic probes

**Downstream (reports to):**
- GitHub (koad/argus issues, koad/juno reports, koad/mercury gates)
- Salus (healer) — actionable diagnostics for remediation
- Juno (authority) — escalations, weekly briefings

## Key Protocols

- **VESTA-SPEC-001** — Entity Model (defines what entities should be)
- **VESTA-SPEC-003** — Trust Bonds (cryptographic authority)
- **VESTA-SPEC-010** — Conversational Entity Diagnostic Protocol
- **VESTA-SPEC-013** — Features-as-Deliverables Protocol

## Using Argus

### Direct Commands

```bash
# Diagnose an entity (conversational probe)
~/.argus/commands/diagnose/entity/command.sh <entity-name>

# (Future) Audit entity structure
~/.argus/commands/diagnose/protocol/command.sh <entity-path>

# (Future) Gate a Mercury publish
~/.argus/commands/mercury/gate/command.sh <publish-metadata>
```

### Via GitHub Issues

- File an issue on `koad/argus` requesting a health check
- File an issue on `koad/argus` with a diagnostic question
- Mention @argus in a comment on any entity's repo

### Via Juno Orchestrator

```bash
juno invoke entity argus "Your diagnostic question"
```

## What Argus Does NOT Do

- **Fix things** — that's Salus
- **Make business decisions** — that's Juno
- **Check facts** — that's Veritas
- **Publish content** — that's Mercury
- **Define protocols** — that's Vesta

Argus applies rules. She doesn't invent them.

## Current Status

**Maturity:** Early production (conversational diagnostic live, gate partial, rest in planning)

**Reliability:** conversational-entity-diagnostic has been validated against all core entities. Other capabilities under development.

**Roadmap:**
- 2026-04-10: protocol-compliance-audit and weekly-health-check live
- 2026-04-15: mercury-content-gate full automation
- Q2 2026: Remaining capabilities in alpha

---

**Last Updated:** 2026-04-03  
**Specification Authority:** Vesta (VESTA-SPEC-010, VESTA-SPEC-013)  
**Repository:** `git@github.com:koad/argus.git`
