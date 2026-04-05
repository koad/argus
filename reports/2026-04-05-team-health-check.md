---
date: 2026-04-05
reviewer: argus
scope: full-team
entities: [juno, vulcan, faber, chiron, vesta, muse, livy, rufus, sibyl, veritas, mercury, argus, salus, aegis, alice]
---

# Full Team Health Check — 2026-04-05

Diagnostic scan of all 15 team entities against the koad:io protocol baseline.

Checks performed:
- `PRIMER.md` present at root
- `hooks/executed-without-arguments.sh` present and executable
- `CLAUDE.md` present
- `README.md` present
- `memories/` directory present (with content)
- `.env` present
- `id/` directory present with key files
- `trust/bonds/` present (with bond files)

---

## juno

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | PASS |
| hooks/executed-without-arguments.sh executable | PASS |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (55 files) |
| .env | PASS |
| id/ with keys | PASS (9 files, includes gpg-revocation.asc) |
| trust/bonds/ | PASS (32 files) |

**Notes:** Fully compliant. Only entity with `gpg-revocation.asc` in `id/`.

---

## vulcan

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | FAIL |
| hooks/executed-without-arguments.sh executable | FAIL |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (4 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** No `hooks/` directory at all. Hook file absent entirely.

---

## faber

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | FAIL |
| hooks/executed-without-arguments.sh executable | FAIL |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (1 file) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (8 files) |

**Notes:** No `hooks/` directory. Memories sparse — only 1 file for an active content entity.

---

## chiron

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | PASS |
| hooks/executed-without-arguments.sh executable | PASS |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (3 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | WARN |

**Notes:** `trust/bonds/` directory exists but contains only a `.gitkeep` — no actual bond files committed. Chiron has not received or issued any trust bonds.

---

## vesta

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | PASS |
| hooks/executed-without-arguments.sh executable | PASS |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (4 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** Fully compliant.

---

## muse

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | FAIL |
| hooks/executed-without-arguments.sh executable | FAIL |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (3 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** No `hooks/` directory. Otherwise baseline-compliant.

---

## livy

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | PASS |
| hooks/executed-without-arguments.sh executable | PASS |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (3 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** Fully compliant.

---

## rufus

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | PASS |
| hooks/executed-without-arguments.sh executable | PASS |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | WARN (1 file) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** Memories directory has only 1 file — sparse for an active entity.

---

## sibyl

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | FAIL |
| hooks/executed-without-arguments.sh executable | FAIL |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (5 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** `hooks/` directory exists but contains only `executed-without-arguments.md` — a documentation file, not the executable shell script. The hook is documented but not implemented.

---

## veritas

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | FAIL |
| hooks/executed-without-arguments.sh executable | FAIL |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (3 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** No `hooks/` directory.

---

## mercury

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | FAIL |
| hooks/executed-without-arguments.sh executable | FAIL |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (5 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** No `hooks/` directory. Mercury is the distribution/announcement entity — hook presence is a priority for autonomous invocation.

---

## argus

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | PASS |
| hooks/executed-without-arguments.sh executable | PASS |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (4 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** Fully compliant.

---

## salus

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | PASS |
| hooks/executed-without-arguments.sh executable | PASS |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (4 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** Fully compliant.

---

## aegis

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | PASS |
| hooks/executed-without-arguments.sh executable | PASS |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (5 files) |
| .env | PASS |
| id/ with keys | PASS (8 files) |
| trust/bonds/ | PASS (2 files) |

**Notes:** Fully compliant.

---

## alice

| Check | Status |
|---|---|
| PRIMER.md | PASS |
| hooks/executed-without-arguments.sh present | FAIL |
| hooks/executed-without-arguments.sh executable | FAIL |
| CLAUDE.md | PASS |
| README.md | PASS |
| memories/ | PASS (8 files) |
| .env | PASS |
| id/ with keys | FAIL |
| trust/bonds/ | FAIL |

**Notes:** Critical gaps. No `hooks/` directory. `id/` directory is empty — no cryptographic keys generated. No `trust/` directory at all (neither `trust/bonds/` nor any trust structure). Alice is a non-sovereign entity with no identity keys and no trust bonds established. This is the most incomplete entity on the team.

---

## Summary Table

| Entity | PRIMER | Hook (.sh) | CLAUDE | README | memories | .env | id/keys | trust/bonds | Score |
|---|---|---|---|---|---|---|---|---|---|
| juno | PASS | PASS | PASS | PASS | PASS | PASS | PASS | PASS | 8/8 |
| vulcan | PASS | FAIL | PASS | PASS | PASS | PASS | PASS | PASS | 7/8 |
| faber | PASS | FAIL | PASS | PASS | PASS | PASS | PASS | PASS | 7/8 |
| chiron | PASS | PASS | PASS | PASS | PASS | PASS | PASS | WARN | 7/8 |
| vesta | PASS | PASS | PASS | PASS | PASS | PASS | PASS | PASS | 8/8 |
| muse | PASS | FAIL | PASS | PASS | PASS | PASS | PASS | PASS | 7/8 |
| livy | PASS | PASS | PASS | PASS | PASS | PASS | PASS | PASS | 8/8 |
| rufus | PASS | PASS | PASS | PASS | WARN | PASS | PASS | PASS | 7/8 |
| sibyl | PASS | FAIL | PASS | PASS | PASS | PASS | PASS | PASS | 7/8 |
| veritas | PASS | FAIL | PASS | PASS | PASS | PASS | PASS | PASS | 7/8 |
| mercury | PASS | FAIL | PASS | PASS | PASS | PASS | PASS | PASS | 7/8 |
| argus | PASS | PASS | PASS | PASS | PASS | PASS | PASS | PASS | 8/8 |
| salus | PASS | PASS | PASS | PASS | PASS | PASS | PASS | PASS | 8/8 |
| aegis | PASS | PASS | PASS | PASS | PASS | PASS | PASS | PASS | 8/8 |
| alice | PASS | FAIL | PASS | PASS | PASS | PASS | FAIL | FAIL | 5/8 |

**Fully compliant (8/8):** juno, vesta, livy, argus, salus, aegis (6/15)
**Minor issues (7/8):** vulcan, faber, chiron, muse, rufus, sibyl, veritas, mercury (8/15)
**Critical issues (5/8):** alice (1/15)

---

## Top 5 Issues Across the Team

### 1. Missing `hooks/executed-without-arguments.sh` — 7 entities affected
**Affected:** vulcan, faber, muse, veritas, mercury, alice (no hooks dir); sibyl (hook doc exists, no .sh)

The hook file is the entity's trained entry point — without it, entities rely on framework defaults rather than entity-specific invocation behavior. This is the single most widespread gap across the team. Salus should prioritize creating the hook scaffold for all 7.

### 2. Alice has no cryptographic identity — blocking trust chain
**Affected:** alice only, but systemic impact

Alice's `id/` directory is empty — no Ed25519, ECDSA, RSA, or DSA keys generated. There is also no `trust/` directory structure. Alice cannot participate in the trust bond system, cannot be cryptographically attributed as an author, and cannot receive or issue bonds. Alice was gestated without key generation completing.

### 3. Chiron has no trust bonds despite active role
**Affected:** chiron

`trust/bonds/` exists with only a `.gitkeep`. Chiron is the curriculum architect for Alice's 12-level system — a role that requires active authorization. No bond from juno to chiron establishing scope has been committed.

### 4. `gpg-revocation.asc` absent from all entities except juno
**Affected:** 14/15 entities

Only juno has a GPG revocation certificate in `id/`. This means 14 entities have no key compromise recovery artifact on-disk. If a key is compromised, revocation requires generating the certificate at that moment — higher risk than having it pre-generated and stored.

### 5. Sparse memories on active entities (faber, rufus)
**Affected:** faber (1 file), rufus (1 file)

Both faber and rufus are active operational entities with only 1 memory file each. Memory files are the persistence layer for learned context and operational preferences. Sparse memories mean context has to be reconstructed each session from scratch rather than loaded from accumulated knowledge.

---

*Report generated by argus. Diagnostic only — no remediation performed.*
*Salus: this report is your work queue.*
