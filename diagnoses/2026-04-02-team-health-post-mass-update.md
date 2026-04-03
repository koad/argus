# Team Health Diagnosis — 2026-04-02 (Post Mass Update)

EXAMINER: Argus
DATE: 2026-04-02
SCOPE: All 11 entities — juno, vulcan, vesta, aegis, mercury, veritas, muse, sibyl, argus, salus, janus
METHOD: Directory inspection, file presence, executability, git config, .env verification

---

## Summary

All 11 entities are gestated and structurally present. The team passed mass onboarding on 2026-04-02. No entity is completely broken. Findings cluster into three tiers: (1) a small set of mature, fully-configured entities; (2) a majority with functional but minimal scaffolding; (3) one entity (sibyl) with a structural anomaly requiring cleanup.

---

## Per-Entity Diagnoses

---

### ENTITY: juno
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Full directory structure present: memories/, commands/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 8 files including 001-identity.md, 002-operational-preferences.md, 005-entity-invocation.md, 008-team-invocation.md — richest memory set on the team
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 173 lines, rich and functional
  - README.md: present
  - opencode.jsonc (root): present, includes "read": "allow" permission
  - opencode/opencode.jsonc: full harness config with mode block, permissions, agent.md
  - opencode/agent.md: present
  - .env: GIT_AUTHOR_NAME=Juno, GIT_AUTHOR_EMAIL=juno@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/juno.git
  - trust/bonds/: koad-to-juno.md + .asc (root bond present and signed), plus outgoing signed bonds to all 10 team entities
  - id/: Ed25519, ECDSA, RSA, DSA keypairs plus gpg-revocation.asc (9 files — complete)
  - commands/: commit, invoke, spawn, status, team — fully operational

WARNING:
  - None

MISSING:
  - None

CRITICAL:
  - None

RECOMMENDATION:
  - No action required. Juno is the reference entity for the team.

---

### ENTITY: vulcan
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Core structure present: memories/, commands/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 3 files — 001-identity.md, 002-operational-preferences.md, 003-team-invocation.md
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 232 lines — richest CLAUDE.md on the team
  - README.md: present
  - opencode.jsonc (root): present, includes "read": "allow" permission
  - opencode/opencode.jsonc: full harness config with mode block and explicit permission matrix; uses {file:../CLAUDE.md} as prompt source
  - .env: GIT_AUTHOR_NAME=Vulcan, GIT_AUTHOR_EMAIL=vulcan@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/vulcan.git
  - trust/bonds/juno-to-vulcan.md + .asc: present and signed
  - id/: Ed25519, ECDSA, RSA, DSA keypairs (8 files — standard set)
  - commands/commit: present

WARNING:
  - opencode/agent.md: MISSING — opencode config uses {file:../CLAUDE.md} as prompt source instead. This works but is non-standard relative to newer entities that use a dedicated agent.md.

MISSING:
  - None

CRITICAL:
  - None

RECOMMENDATION:
  - Route to Salus: add opencode/agent.md stub, or document that CLAUDE.md-as-prompt is the intentional Vulcan pattern — resolve the inconsistency with team standard.

---

### ENTITY: vesta
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Core structure present: memories/, commands/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 3 files — 001-identity.md, 002-operational-preferences.md, 003-team-invocation.md
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 148 lines — substantial
  - README.md: present
  - opencode.jsonc (root): present, includes "read": "allow" permission
  - opencode/opencode.jsonc: full harness config with mode block and explicit permission matrix; uses {file:../CLAUDE.md} as prompt source
  - .env: GIT_AUTHOR_NAME=Vesta, GIT_AUTHOR_EMAIL=vesta@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/vesta.git
  - trust/bonds/juno-to-vesta.md + .asc: present and signed
  - id/: Ed25519, ECDSA, RSA, DSA keypairs (8 files — standard)
  - commands/: commit, spawn, check-issues, status — more developed than most entities

WARNING:
  - opencode/agent.md: MISSING — same pattern as Vulcan; opencode config uses {file:../CLAUDE.md}

MISSING:
  - None

CRITICAL:
  - None

RECOMMENDATION:
  - Route to Salus: align agent.md presence if CLAUDE.md-as-prompt is not the intended final pattern for Vesta.

---

### ENTITY: aegis
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Core structure present: memories/, commands/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 4 files — 001-identity.md, 002-operational-preferences.md, 003-team-invocation.md, 004-first-session-brief.md
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 52 lines — minimal but functional; defines role, trust chain, principles
  - README.md: present
  - opencode.jsonc (root): present
  - opencode/agent.md: present
  - .env: GIT_AUTHOR_NAME=Aegis, GIT_AUTHOR_EMAIL=aegis@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/aegis.git
  - trust/bonds/juno-to-aegis.md + .asc: present and signed
  - id/: Ed25519, ECDSA, RSA, DSA keypairs (8 files — standard)
  - commands/commit: present

WARNING:
  - opencode.jsonc (root): 108 bytes — missing "read": "allow" permission present in juno/vulcan/vesta/salus
  - opencode/opencode.jsonc: minimal config (no mode block, no explicit permission matrix)
  - CLAUDE.md: 52 lines — stub-level for a counsel entity

MISSING:
  - None structurally

CRITICAL:
  - None

RECOMMENDATION:
  - Route to Salus: expand opencode.jsonc to include read:allow; assess whether full harness config is needed for Aegis's private-counsel role.

---

### ENTITY: mercury
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Core structure present: memories/, commands/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 5 files — 001-identity.md, 002-operational-preferences.md, 003-guardrails.md, 004-team-invocation.md, 005-home-machine.md — good depth including guardrails
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 73 lines — modest but above stub
  - README.md: present
  - opencode.jsonc (root): present
  - opencode/agent.md: present
  - .env: GIT_AUTHOR_NAME=Mercury, GIT_AUTHOR_EMAIL=mercury@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/mercury.git
  - trust/bonds/juno-to-mercury.md + .asc: present and signed
  - id/: Ed25519, ECDSA, RSA, DSA keypairs (8 files — standard)
  - commands/commit: present

WARNING:
  - opencode.jsonc (root): 108 bytes — missing "read": "allow" permission
  - opencode/opencode.jsonc: minimal config (no mode block, no explicit permission matrix)
  - CLAUDE.md: 73 lines — could be richer given Mercury's public-facing publishing role

MISSING:
  - None structurally

CRITICAL:
  - None

RECOMMENDATION:
  - Route to Salus: expand opencode.jsonc read permissions; Mercury publishes content and needs adequate read scope to function.

---

### ENTITY: veritas
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Core structure present: memories/, commands/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 3 files — 001-identity.md, 002-operational-preferences.md, 003-team-invocation.md
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 52 lines — minimal but present
  - README.md: present
  - opencode.jsonc (root): present
  - opencode/agent.md: present
  - opencode/skills/: directory present — audit tooling scaffold (unique to Veritas)
  - opencode/: full bun/node harness installed (bun.lock, node_modules, package.json, tui.json)
  - .env: GIT_AUTHOR_NAME=Veritas, GIT_AUTHOR_EMAIL=veritas@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/veritas.git
  - trust/bonds/juno-to-veritas.md + .asc: present and signed
  - id/: Ed25519, ECDSA, RSA, DSA keypairs (8 files — standard)
  - commands/commit: present
  - reports/ and reviews/ directories present

WARNING:
  - opencode.jsonc (root): 108 bytes — missing "read": "allow" permission
  - opencode/opencode.jsonc: minimal config despite having the full harness installed — the node_modules are present but the config doesn't unlock them

MISSING:
  - None structurally

CRITICAL:
  - None

RECOMMENDATION:
  - Route to Salus: expand opencode.jsonc to match full harness pattern; Veritas has the node_modules but the config doesn't leverage them.

---

### ENTITY: muse
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Core structure present: memories/, commands/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 3 files — 001-identity.md, 002-operational-preferences.md, 003-team-invocation.md
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 52 lines — minimal but present
  - README.md: present
  - opencode.jsonc (root): present
  - opencode/agent.md: present
  - .env: GIT_AUTHOR_NAME=Muse, GIT_AUTHOR_EMAIL=muse@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/muse.git
  - trust/bonds/juno-to-muse.md + .asc: present and signed
  - id/: Ed25519, ECDSA, RSA, DSA keypairs (8 files — standard)
  - commands/commit: present
  - briefs/ directory present

WARNING:
  - opencode.jsonc (root): 108 bytes — missing "read": "allow" permission
  - opencode/opencode.jsonc: minimal config (no mode block, no explicit permission matrix)
  - CLAUDE.md: 52 lines — stub level for a creative entity

MISSING:
  - None structurally

CRITICAL:
  - None

RECOMMENDATION:
  - Route to Salus: expand opencode.jsonc read permissions; expand CLAUDE.md to describe creative workflow and design principles.

---

### ENTITY: sibyl
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Core structure mostly present: memories/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 4 files — 001-identity.md, 002-operational-preferences.md, 003-team-invocation.md, 004-home-machine.md — includes home-machine context
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 52 lines — minimal but present
  - README.md: present
  - opencode.jsonc (root): present
  - opencode/agent.md: present
  - .env: GIT_AUTHOR_NAME=Sibyl, GIT_AUTHOR_EMAIL=sibyl@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/sibyl.git
  - trust/bonds/juno-to-sibyl.md + .asc: present and signed (canonical path)
  - id/: Ed25519, ECDSA, RSA, DSA keypairs (8 files — standard)
  - research/ directory present

WARNING:
  - opencode.jsonc (root): 108 bytes — missing "read": "allow" permission
  - opencode/opencode.jsonc: minimal config (no mode block, no explicit permission matrix)
  - trust/: has duplicate bond files — juno-to-sibyl bond exists in BOTH trust/bonds/ AND trust/juno/ (non-standard path). The trust/bonds/ copy is canonical; trust/juno/ is an orphaned earlier layout.
  - trust/koad/: directory exists but is EMPTY — orphaned scaffold, no files inside

MISSING:
  - commands/: DIRECTORY ENTIRELY ABSENT — sibyl is the only entity on the team with no commands directory

CRITICAL:
  - commands/ directory missing — Sibyl cannot execute the standard commit workflow. This is the only entity in this state. Blocks autonomous operation.

RECOMMENDATION:
  - Route to Salus for repair:
    1. Create commands/commit scaffold matching the team standard
    2. Remove duplicate bond files from trust/juno/ (keep trust/bonds/ as canonical)
    3. Remove empty trust/koad/ directory
    4. Expand opencode.jsonc to include "read": "allow"

---

### ENTITY: argus
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Core structure present: memories/, commands/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 4 files — 001-identity.md, 002-operational-preferences.md, 003-mercury-gate.md, 004-team-invocation.md
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 67 lines — above stub, defines diagnostic role clearly
  - README.md: present
  - opencode.jsonc (root): present
  - opencode/agent.md: present
  - .env: GIT_AUTHOR_NAME=Argus, GIT_AUTHOR_EMAIL=argus@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/argus.git
  - trust/bonds/juno-to-argus.md + .asc: present and signed
  - id/: Ed25519, ECDSA, RSA, DSA keypairs (8 files — standard)
  - commands/commit: present
  - diagnoses/ and reports/ directories present

WARNING:
  - opencode.jsonc (root): 108 bytes — missing "read": "allow" permission. Argus needs broad read access to diagnose all entities; this is a functional limitation.
  - opencode/opencode.jsonc: minimal config (no mode block, no explicit permission matrix). A diagnostician with broad read requirements should have explicit read permissions scoped to all entity directories.

MISSING:
  - None structurally

CRITICAL:
  - None — but the read permission gap directly impacts Argus's primary function.

RECOMMENDATION:
  - Route to Salus: expand opencode.jsonc to include explicit "read": "allow" and ideally an explicit permission matrix covering ~/.juno, ~/.vulcan, and all other entity paths. Argus's function depends on read access across the team.

---

### ENTITY: salus
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Core structure present: memories/, commands/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 3 files — 001-identity.md, 002-operational-preferences.md, 003-team-invocation.md
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 52 lines — minimal but present
  - README.md: present
  - opencode.jsonc (root): present, includes "read": "allow" (one of only 4 entities with this)
  - opencode/agent.md: present
  - .env: GIT_AUTHOR_NAME=Salus, GIT_AUTHOR_EMAIL=salus@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/salus.git
  - trust/bonds/juno-to-salus.md + .asc: present and signed
  - id/: Ed25519, ECDSA, RSA, DSA keypairs (8 files — standard)
  - commands/commit: present
  - protocols/ directory present (healer scaffold)

WARNING:
  - opencode/opencode.jsonc: minimal config (no mode block, no explicit permission matrix). Salus repairs entity directories — write access to other entities requires deliberate scoping.
  - CLAUDE.md: 52 lines — stub level for a healer entity that needs to understand all entity structures

MISSING:
  - None structurally

CRITICAL:
  - None

RECOMMENDATION:
  - Route to koad: Salus needs explicit write permissions to other entity directories to perform repairs — this requires deliberate authorization and scoping before Salus can operate as healer. This is a human decision.

---

### ENTITY: janus
DATE: 2026-04-02
EXAMINER: Argus

HEALTHY:
  - Core structure present: memories/, commands/, hooks/, trust/, id/, comms/
  - hooks/executed-without-arguments.sh: exists and executable
  - memories/: 4 files — 001-identity.md, 002-operational-preferences.md, 003-team-invocation.md, 004-watch-targets.md — includes watch-targets context
  - comms/inbox/ and comms/outbox/: both present
  - CLAUDE.md: 51 lines — minimal but present
  - README.md: present
  - opencode.jsonc (root): present
  - opencode/agent.md: present
  - .env: GIT_AUTHOR_NAME=Janus, GIT_AUTHOR_EMAIL=janus@kingofalldata.com
  - git config user.name/email: matches .env
  - git remote: git@github.com:koad/janus.git
  - trust/bonds/juno-to-janus.md + .asc: present and signed
  - id/: Ed25519, ECDSA, RSA, DSA keypairs (8 files — standard)
  - commands/commit: present
  - watches/ and reports/ directories present

WARNING:
  - opencode.jsonc (root): 108 bytes — missing "read": "allow" permission. Janus watches for events across systems; read access gap limits function.
  - opencode/opencode.jsonc: minimal config (no mode block, no explicit permission matrix)

MISSING:
  - None structurally

CRITICAL:
  - None

RECOMMENDATION:
  - Route to Salus: expand opencode.jsonc to include "read": "allow" and permissions appropriate for event-watching across entity directories.

---

## Team-Wide Findings

### What's Healthy Across the Board (11 of 11)
- All 11 entity directories exist and are initialized git repos
- All 11 have GitHub remotes configured at git@github.com:koad/<entity>.git
- All 11 have .env with correct GIT_AUTHOR_NAME and GIT_AUTHOR_EMAIL
- All 11 have git config user.name/email set, matching .env
- All 11 have hooks/executed-without-arguments.sh present and executable
- All 11 have at least 3 memory files including 001-identity.md and 002-operational-preferences.md
- All 11 have a team-invocation memory file
- All 11 have comms/inbox/ and comms/outbox/ present
- All 11 have CLAUDE.md and README.md present
- All 11 have opencode.jsonc at root level
- All 11 have a signed inbound trust bond in trust/bonds/ (koad-to-juno for Juno; juno-to-<entity> for all others)
- All 11 have id/ with standard Ed25519, ECDSA, RSA, DSA keypairs

### Patterns Requiring Team-Wide Attention

**opencode.jsonc read:allow gap — 7 of 11 entities**
aegis, mercury, veritas, muse, sibyl, argus, janus have 108-byte minimal opencode.jsonc lacking "read": "allow".
Only juno, vulcan, vesta, salus have this permission set.
For diagnostic (argus), healing (salus), research (sibyl), watching (janus), and publishing (mercury) entities, restricted read is a functional limitation against their stated roles.

**opencode full harness config gap — 9 of 11 entities**
Only vulcan and vesta have a full mode/permission matrix in opencode/opencode.jsonc.
All others have minimal configs (schema + external_directory only).
The full harness represents the mature, explicit, secure pattern.

**opencode/agent.md gap — 2 of 11 entities**
vulcan and vesta lack agent.md, using {file:../CLAUDE.md} as prompt source instead.
This is an older pattern. May be intentional for these two older entities but is inconsistent with the rest of the team.

**CLAUDE.md depth gap — 7 of 11 entities**
juno (173), vulcan (232), vesta (148), mercury (73), argus (67) have substantive CLAUDE.md files.
aegis, veritas, muse, sibyl, salus, janus are at 51-52 lines — stub level. These need expansion to provide useful role guidance in operational sessions.

**No koad-to-entity root bond except juno**
Only Juno holds a koad-to-juno trust bond. All other entities are authorized exclusively via juno-to-entity bonds. This is the expected trust chain design — no entity can act independently outside Juno's authorization scope. Documented for completeness, not a defect.

### Critical Findings (Team Level)
- **sibyl: commands/ directory entirely missing** — only entity on the team without an operational command scaffold. Blocks standard commit workflow and autonomous operation.
- **sibyl: duplicate trust bond files and empty trust/koad/ directory** — trust layout is inconsistent with all other entities and contains orphaned structure from an earlier layout.

---

## Repair Routing Summary

**Route to Salus (entity repair):**
- sibyl: create commands/commit scaffold matching team standard
- sibyl: consolidate trust/ layout — remove trust/juno/ (duplicate), remove empty trust/koad/
- argus, janus, mercury, muse, veritas, aegis, sibyl: add "read": "allow" to opencode.jsonc
- All 9 entities with minimal opencode/opencode.jsonc: evaluate full harness config upgrade
- vulcan, vesta: add agent.md or document CLAUDE.md-as-prompt as intentional design
- All stub CLAUDE.md entities (aegis, veritas, muse, sibyl, salus, janus): expand to meaningful role guidance

**Route to koad (human authorization required):**
- salus: define explicit write permissions to other entity directories before Salus can operate as healer — this requires deliberate scoping and a trust bond upgrade
- Team decision: canonical opencode prompt source — agent.md (current team standard) or CLAUDE.md (vulcan/vesta pattern)
