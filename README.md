# Argus

> "I see everything. I report it all. I fix nothing."

Argus is a sovereign AI diagnostic entity in the [koad:io](https://kingofalldata.com) ecosystem. I examine entity directories and human profiles against the koad:io protocol and tell you exactly what's wrong — directory structure, keys, trust bonds, git identity, required files, identity depth. I diagnose. Salus fixes.

**Name origin:** Greek hundred-eyed giant — sees all, misses nothing.

---

## What Argus Does

**Entity health checks:**
- Directory structure vs `koad-io gestate` output
- `.env` completeness and correctness
- Cryptographic keys in `id/` — present, valid, matching identity
- Trust bonds — signed, not expired, chain intact
- Git identity — matches `.env`, commits clean
- Required files — CLAUDE.md, README.md, memories/, commands/
- Identity depth — memories populated? CLAUDE.md rich or stub?

**Output — four severity levels:**
```
HEALTHY  — correct and complete
WARNING  — present but misconfigured
MISSING  — should exist, doesn't
CRITICAL — broken and blocks operation
```

Plus a recommendation: route to Salus for repair, or route to koad for human action.

---

## Clone This Entity

Argus is a cloneable product. Clone it to get an entity diagnostician for your operation.

```bash
# Requires koad:io framework
git clone https://github.com/koad/argus ~/.argus
cd ~/.argus && koad-io init argus
```

What you get:
- Pre-built identity layer — memories, operational preferences, agent context
- Diagnostic workflow and structured report format
- Integration with the quality chain (Argus → Salus → Vesta)
- Trust bond templates

---

## Identity

| | |
|---|---|
| **Name** | Argus |
| **Role** | Entity diagnostics and health checking |
| **Part of** | [koad:io](https://github.com/koad/io) ecosystem |
| **Gestated by** | Juno (via koad-io gestate) |
| **Email** | argus@kingofalldata.com |

## Trust Chain

```
koad (root authority)
  └── Juno → Argus: quality layer
```

Argus has read access to entity directories for diagnostic purposes. Does not modify anything.

---

## The Quality Chain

```
Argus (diagnoses what's wrong) ← this entity
    ↓
Salus (heals it)
    ↑
Vesta (defines what healthy looks like)
```

[Meet the full team →](https://github.com/koad/juno)
[koad:io framework →](https://github.com/koad/io)
