---
date: 2026-04-05
assessor: argus
type: midpoint-health-check
context: post-Salus-remediation
---
# Day 33 Entity Health Check

## Summary table

| Entity  | Dir | Git Remote | PRIMER.md | Keys | Trust Bond | Status    |
|---------|-----|------------|-----------|------|------------|-----------|
| juno    | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| vulcan  | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| alice   | ✓   | ✓          | ✓         | ✗    | ✓          | WARN      |
| astro   | ✗   | —          | ✗         | ✗    | ✗          | CRITICAL  |
| veritas | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| mercury | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| muse    | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| sibyl   | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| argus   | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| salus   | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| janus   | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| aegis   | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| faber   | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| chiron  | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| livy    | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| rufus   | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| vesta   | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| lyra    | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |
| copia   | ✓   | ✓          | ✓         | ✓    | ✓          | COMPLIANT |

## Counts

- **COMPLIANT: 17/19**
- **WARN: 1** (alice)
- **CRITICAL: 1** (astro)

## Changes since Day 30 EOD

Salus remediation successfully landed for all three targeted items:

- **Iris** (not in the 19-entity audit set, but tracked by Salus): PRIMER.md added at commit `b9abfb5`. Verified present on disk.
- **Lyra**: README.md added at commit `0937f25`. PRIMER.md was already present from gestation. Now fully COMPLIANT — upgraded from WARN.
- **Copia**: README.md added at commit `ee4263a`. PRIMER.md was already present from gestation. Now fully COMPLIANT — upgraded from WARN.

Net improvement: **+2 COMPLIANT** (Lyra and Copia cleared). COMPLIANT count rises from 15/19 to 17/19 against the 4-criterion set used here (passenger.json excluded per scope).

Note: Iris is an active entity (commits as recently as Day 34 review) but does not appear in the canonical 19-entity roster. Recommend Argus flag for roster reconciliation — Iris may need formal gestation or roster addition.

## Remaining WARN items

| Entity | Issue | Fix |
|--------|-------|-----|
| alice  | `id/` directory contains only `.gitignore` — no `.pub` key files | Run `koad-io gestate` key generation for alice, or manually generate Ed25519 keypair and commit public key to `~/.alice/id/` |

Alice's keys directory has existed since Mar 16 with only a `.gitignore` placeholder. All other criteria pass. This is a long-standing gap that predates Day 30.

## CRITICAL items

| Entity | Issue | Fix |
|--------|-------|-----|
| astro  | Entity directory `/home/koad/.astro` does not exist on thinker | Gestate astro via `koad-io gestate astro`; initialize git repo; push to GitHub |

Astro has no local directory, no git remote, no keys, no PRIMER, no trust bonds. Astro is referenced in memory as "ring zero" (genuine peer relationship, already there) but has no on-disk presence on thinker. If astro lives on another machine (fourty4 or wonderland), that should be documented and the thinker gap noted explicitly.

## Audit notes

- Criteria checked: directory existence, git remote, PRIMER.md, at least one `.pub` key in `id/`, at least one file in `trust/bonds/`.
- passenger.json criterion excluded per scope (blocked on koad, daemon-layer work).
- All 17 COMPLIANT entities have 2+ trust bond files on file; juno has 38 (hub entity expected).
- Lyra and Copia PRIMER.md files confirmed pre-existing (both dated Apr 4); Salus added README.md files, which are not a compliance criterion but improve discoverability.
