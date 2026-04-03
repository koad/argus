---
date: 2026-04-03
type: audit-report
status: COMPLETE
auditor: Argus
title: Vesta Spec Audit — SPEC-006 and SPEC-008
---

# Vesta Spec Audit Report
**Date:** 2026-04-03  
**Auditor:** Argus  
**Scope:** VESTA-SPEC-006 (Commands System) and VESTA-SPEC-008 (Spawn Protocol)  
**Verdict:** **NOT READY FOR PROMOTION**

---

## Executive Summary

Both specs have significant gaps and conformance issues:

- **VESTA-SPEC-006**: Internal consistency OK, but cascade environment loading is underspecified. Juno commands don't follow spec requirements.
- **VESTA-SPEC-008**: Critical security gap — no trust bond enforcement. Multiple pre-flight checks missing. Trust bond file format is inconsistent within the spec itself.

**Recommendation:** Do NOT promote either spec to canonical until gaps are resolved and implementations are updated.

---

## VESTA-SPEC-006 Audit

### Completeness Issues

#### 1. Cascade Environment Loading Underspecified (HIGH PRIORITY)
- Section 4 describes the loading order but doesn't specify:
  - Is cascade loading done with `source`? With `set -a`/`set +a`?
  - How are special characters in .env values handled?
  - Are comments stripped or preserved?
- **Impact:** Implementations may behave differently
- **Fix:** Add 2-3 paragraphs clarifying cascade mechanics with example

#### 2. Environment Variable Isolation in Subcommands (MEDIUM)
- Unclear if parent/framework variables are available in subcommand `.env`
- Example: Is `ENTITY_DIR` available in `~/.juno/commands/commit/self/command.sh`?
- **Impact:** Subcommand implementations may fail if assumptions differ
- **Fix:** Add table showing variable scope at each depth

#### 3. Working Directory Guarantees Missing (MEDIUM)
- Section 5.1 doesn't specify if `$PWD` is guaranteed to equal `$ENTITY_DIR` at command start
- **Impact:** Commands may use relative paths that fail
- **Fix:** Add explicit guarantee: "Commands execute with `$PWD = $ENTITY_DIR`"

#### 4. Debug Mode Not Fully Specified (LOW)
- Section 10.4 says "Implementation-specific" but doesn't define dispatcher requirements
- **Fix:** Either mandate debug mode or remove from spec

### Conformance Issues

#### Issue 1: Juno Commands Don't Use Cascade Variables (MEDIUM)
**Files:** `~/.juno/commands/invoke/entity/command.sh`, `invoke/free/command.sh`

Commands construct `ENTITY_DIR="$HOME/.$ENTITY_NAME"` instead of using `$ENTITY_DIR` from cascade.

**Spec violation:** Section 2.2 (Guaranteed environment variables)

**Fix:** Update commands to use `$ENTITY_DIR` directly from environment.

#### Issue 2: Framework Commands Lack Documentation (LOW)
**Files:** Most `~/.koad-io/commands/` subdirectories

Very few commands have README.md. Spec says optional, but discovering command arguments requires reading source.

**Fix:** Add README.md to framework commands (assert, gestate, build, etc.)

#### Issue 3: No Command .env Files Exist (LOW)
- Section 2.4 describes command-local `.env` files
- No commands in framework or juno use this feature
- **Impact:** Unclear if feature is implemented/tested
- **Fix:** Create at least one example command with `.env` to verify

### SPEC-006 Verdict

**Status:** INCOMPLETE — Not ready for canonical promotion

**Blockers:**
1. Cascade environment loading mechanism not fully specified
2. Juno command implementations don't follow spec
3. Environment variable scope in subcommands unclear

**Path to readiness:**
- Clarify cascade loading in section 4 (add `source` + `set -a`/`set +a` details)
- Add environment variable scope table for subcommands
- Update juno commands to use cascade variables
- Add one example command.env to demonstrate feature

**Estimated effort:** 2-3 hours (spec + implementation fixes)

---

## VESTA-SPEC-008 Audit

### Completeness Issues

#### 1. Trust Bond File Format Inconsistent (CRITICAL)
- Section 2.1 uses `jq` (JSON format)
- Section 3.2 uses `grep` (plain text format)
- File named `*.md` but operations suggest structured format
- **Impact:** Cannot implement bond verification without format clarity
- **Fix:** Document format (markdown with YAML frontmatter? JSON? Plain text?) with example in Appendix B

#### 2. Containment Status File Format Not Documented (MEDIUM)
- Section 8.1 references `~/.koad-io/containment/${CHILD_ENTITY}.status`
- File format, field names, valid values not specified
- Example: Is it `level: Pause` or `level: pause`? Case sensitive?
- **Impact:** Cannot implement containment checks
- **Fix:** Document file format with examples for each level

#### 3. VESTA-SPEC-005 Reference Not Provided (HIGH)
- Section 4 references "cascade environment (as defined in VESTA-SPEC-005)"
- SPEC-005 not provided for audit
- Cannot verify consistency with SPEC-006 cascade loading
- **Impact:** Unclear if spawn environment differs from command environment
- **Fix:** Either provide SPEC-005 or inline cascade specification

#### 4. Logging Specification Incomplete (MEDIUM)
- Section 7.2 says logging "if enabled" but doesn't specify:
  - How is logging enabled? (env var? config file?)
  - Is logging required or optional?
  - Log format and rotation policy?
- **Impact:** Logging may not exist; diagnostics missing
- **Fix:** Clarify if logging is required; specify format and location

#### 5. Signal Handler Requirements Vague (MEDIUM)
- Section 6.3 shows example trap but doesn't specify if mandatory
- 10-second grace period hard-coded; should it be configurable?
- **Impact:** Implementations may not handle termination consistently
- **Fix:** Clarify signal handler requirements and timeouts

#### 6. Process Limit Threshold Unclear (LOW)
- Section 3.2 Step 4 hard-codes `MAX_INSTANCES=4`
- Is this configurable? Required? Default only?
- **Impact:** Implementations will use different limits
- **Fix:** Clarify if configurable or fixed default

### Conformance Issues

#### CRITICAL Issue 1: No Trust Bond Verification (SECURITY)
**File:** `~/.juno/commands/spawn/process/command.sh`

The command uses `--dangerously-skip-permissions`, completely bypassing trust bond checks.

**Spec requirement (section 2.1):**
```
An entity X can only spawn entity Y if:
- Entity X holds a valid trust bond FROM entity Y, OR
- Entity X is koad (root authority)
```

**Current implementation:** None. Uses flag to skip all permission checks.

**Impact:** CRITICAL SECURITY GAP
- Any entity can spawn any other entity without authorization
- Violates the entire authority model of the protocol
- Defeats the purpose of trust bonds

**Fix:** Implement section 3.2 Step 2: Trust Bond Verification before line 33

#### CRITICAL Issue 2: Missing Pre-Flight Checks Steps 2-4 (PROTOCOL)
**File:** `~/.juno/commands/spawn/process/command.sh`

Section 3.2 requires 4 pre-flight checks:
- ✅ Step 1: Entity Existence — **IMPLEMENTED**
- ❌ Step 2: Trust Bond Verification — **MISSING** (see Issue 1)
- ❌ Step 3: Entity Readiness (CLAUDE.md, disk space) — **MISSING**
- ❌ Step 4: Process Limits — **MISSING**

**Impact:** Protocol safety mechanisms not enforced. Can spawn:
- Entities without CLAUDE.md
- When disk space < 100 MB
- When process limit exceeded

**Fix:** Implement all 4 steps with correct exit codes (28, 73)

#### Issue 3: No Timeout Implementation (RESOURCE CONTROL)
**File:** `~/.juno/commands/spawn/process/command.sh`

Section 6.4 requires timeout handling:
- Default timeout: 3600s (1 hour)
- Support `--timeout` flag
- On timeout: SIGTERM, wait 10s, SIGKILL, exit 124

**Current implementation:** No timeout at all. Processes can run indefinitely.

**Impact:** No resource control. Child processes can consume resources forever.

**Fix:** Implement timeout with timeout(1) command or signal handlers

#### Issue 4: No Environment Isolation Flag (TESTING)
**File:** `~/.juno/commands/spawn/process/command.sh`

Section 4.2 specifies `--isolated` flag to clear parent environment.

**Current implementation:** None. Always inherits parent environment.

**Impact:** Cannot test child entities in clean environment.

**Fix:** Add `--isolated` flag support

#### Issue 5: No Output Capture Flags (OBSERVABILITY)
**File:** `~/.juno/commands/spawn/process/command.sh`

Section 5.3 requires `--output` and `--quiet` flags.

**Current implementation:** None. Always streams to terminal.

**Impact:** Cannot capture output for logging or automated testing.

**Fix:** Add `--output=/path` and `--quiet` flag support

#### Issue 6: No Diagnostic Logging (DEBUGGING)
**File:** `~/.juno/commands/spawn/process/command.sh`

Section 7.2 requires logging spawn attempts, task start/end, errors, exit codes.

**Current implementation:** No logging at all.

**Impact:** Cannot debug spawn failures or audit spawn history.

**Fix:** Implement logging to `~/.koad-io/logs/spawn.log`

#### Issue 7: No Containment Status Check (SAFETY)
**File:** `~/.juno/commands/spawn/process/command.sh`

Section 8.1 requires checking entity containment status before spawn.

**Current implementation:** No check.

**Impact:** Cannot prevent spawning of contained/isolated entities.

**Fix:** Add containment check per section 8.1

#### Issue 8: Missing Cascade Environment Setup (SECURITY)
**File:** `~/.juno/commands/spawn/process/command.sh`

Command uses `--dangerously-skip-permissions` instead of cascade loading per section 4.

**Current implementation:** Skips all permission/environment setup.

**Impact:** Spec environment management not used; security model bypassed.

**Fix:** Remove flag and implement cascade per section 4

### SPEC-008 Verdict

**Status:** INCOMPLETE — Not ready for canonical promotion

**Critical Blockers:**
1. Trust bond file format inconsistent (jq vs grep in same spec)
2. Juno spawn implementation doesn't implement trust bonds (security gap)
3. Missing pre-flight checks Steps 2-4 (protocol gap)
4. No timeout implementation (resource control gap)
5. Containment status file format not documented

**Major Issues:**
1. Reference to undefined VESTA-SPEC-005
2. Logging specification incomplete (required? optional?)
3. Output capture flags not implemented
4. Cascade environment not fully specified

**Path to readiness:**
- Document trust bond file format with examples (Appendix B)
- Document containment status file format with examples (Appendix C)
- Clarify/inline VESTA-SPEC-005 cascade specification
- Update juno spawn to implement all pre-flight checks, timeout, logging
- Clarify logging requirement (mandatory? optional?)
- Add process limit and signal timeout documentation

**Estimated effort:** 4-6 hours (spec + implementation fixes)

---

## GitHub Issues Filed

| Issue | Title | Severity |
|-------|-------|----------|
| koad/vesta#26 | SPEC-006 audit: Cascade environment loading underspecified | HIGH |
| koad/vesta#27 | SPEC-006 conformance: juno commands don't use cascade variables | MEDIUM |
| koad/vesta#28 | SPEC-008: Trust bond file format is inconsistent | HIGH |
| koad/vesta#29 | SPEC-008 CRITICAL: juno spawn doesn't implement trust bonds | **CRITICAL** |
| koad/vesta#30 | SPEC-008: Containment status file format not documented | MEDIUM |
| koad/vesta#31 | SPEC-008: Missing reference to VESTA-SPEC-005 | HIGH |
| koad/vesta#32 | SPEC-008 conformance: juno spawn missing pre-flight checks | CRITICAL |

---

## Recommendations

### Immediate (Blocking Promotion)

1. **Clarify trust bond format** — decide on YAML/JSON/plain text with examples
2. **Fix juno spawn trust bond check** — implement section 3.2 Step 2 
3. **Document containment status format** — with examples per level
4. **Provide or inline SPEC-005** — clarify cascade environment semantics
5. **Update juno spawn** — implement all 4 pre-flight checks

### High Priority (Before Canonical)

1. Clarify cascade loading mechanics (set -a/set +a)
2. Add environment variable scope documentation
3. Implement timeout handling in juno spawn
4. Add diagnostic logging to juno spawn
5. Add output capture flags to juno spawn

### Medium Priority

1. Add README.md to framework commands
2. Create example command.env to demonstrate feature
3. Clarify signal handler requirements
4. Document process limit configuration

---

## Summary

**VESTA-SPEC-006:** Mostly complete, but cascade environment loading needs clarification and juno commands need updating to follow spec.

**VESTA-SPEC-008:** Significant gaps in file format specifications and critical security issue (no trust bond enforcement). Current juno spawn implementation is a skeleton that doesn't implement most protocol requirements.

**Overall:** Neither spec is ready for canonical promotion. However, both specs define sound architectural patterns (cascade environment, trust-based authority, spawn process isolation). With clarifications and implementation fixes, both can reach canonical status within 1-2 sprint cycles.

**Verdict:** REJECT promotion. Return to Vesta for gap closure.
