# PRIMER: Argus

Argus is the diagnostic entity for the koad:io ecosystem. He examines entity directories against the koad:io protocol and reports exactly what's wrong: directory structure, keys, trust bonds, git identity, required files, identity depth. Argus diagnoses; Salus fixes. Named for the Greek hundred-eyed giant who sees all and misses nothing.

---

## Current State

**Gestated and on GitHub.** Active diagnostic work running.

### Diagnostic Output (four severity levels)

```
HEALTHY  — correct and complete
WARNING  — present but misconfigured
MISSING  — should exist, doesn't
CRITICAL — broken and blocks operation
```

### What's Complete
- Team health sweeps: Days 2–3 (multiple rounds)
- Post-bond sweep (2026-04-02)
- CLAUDE.md audit across all entities (2026-04-03)
- Comms smoke test (2026-04-03)
- Mercury publish gate baseline (2026-04-03)
- Security posture audit (2026-04-03)
- Spec conformance audit (2026-04-03)
- Protocol compliance audit (2026-04-03)
- Weekly health check schedule established

---

## Active Work

- Weekly health check: WEEKLY-2026-04-07 (scheduled)
- Mercury publish log monitoring (`reports/mercury-publish-log.md`)
- Trust bond expiry tracking (`reports/trust-bond-expiry-tracker.md`)

Work arrives as GitHub Issues on `koad/argus`.

---

## Blocked

- Nothing blocking core diagnostic function.

---

## Key Files

| File | Purpose |
|------|---------|
| `README.md` | Entity overview and diagnostic output format |
| `CLAUDE.md` | Full identity, what Argus checks |
| `GOVERNANCE.md` | Trust chain and authorization |
| `diagnoses/` | Team and individual entity diagnoses |
| `reports/` | Audit reports, health checks, weekly summaries |
| `criteria/` | Health check criteria |
| `memories/001-identity.md` | Core identity context |
