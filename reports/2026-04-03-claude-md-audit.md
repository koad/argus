# CLAUDE.md Standardization Audit
**Date:** 2026-04-03  
**Authority:** Argus  
**Scope:** Template consistency across 12 koad:io entities

---

## Canonical Template (Proposed)

All CLAUDE.md files should follow this structure:

1. **Header** — filename and entity name
2. **What I Am** — entity identity and purpose
3. **Two-Layer Architecture** — framework vs entity layer diagram
4. **Position in Team** — reporting structure and quality chain
5. **Key Protocols** — owned or operated protocols
6. **Behavioral Constraints** — core rules and limitations
7. **Key Files** — directory and file reference table
8. **Git Identity** — author name and email
9. **Session Start** — startup checklist
10. **Communication Protocol** — how work is received and reported

---

## Current State Audit

| Entity | Lines | Sections | Has Header | Has Identity | Has Role | Has Constraints | Has Key Files | Has Git ID | Has Session | Status |
|--------|-------|----------|-----------|--------------|----------|-----------------|---------------|-----------|-------------|--------|
| aegis | 106 | 11 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | — | ⚠️ Partial |
| argus | 114 | 11 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ Complete |
| iris | 87 | 10 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | — | ⚠️ Partial |
| janus | 110 | 12 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | — | ⚠️ Partial |
| juno | 199 | 17 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ Complete |
| mercury | 161 | 14 | ✓ | ✓ | ✓ | — | ✓ | — | — | ⚠️ Partial |
| muse | 134 | 13 | ✓ | ✓ | ✓ | ✓ | — | — | — | ⚠️ Partial |
| salus | 116 | 13 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | — | ⚠️ Partial |
| sibyl | 138 | 17 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ Complete |
| veritas | 122 | 10 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | — | ⚠️ Partial |
| vesta | 115 | 11 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | — | ⚠️ Partial |
| vulcan | 192 | 14 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ Complete |

---

## Deviations from Canonical Template

### Missing Sections (non-critical)
- **aegis, iris, janus, salus, veritas, vesta:** No formal "Session Start" checklist
- **mercury, muse:** No "Git Identity" section
- **muse:** No "Key Files" reference table

### Variations in Naming
- "What I Am" vs "What This Is"
- "Role" vs "Contribution" vs "What I Do"
- "Behavioral Constraints" vs "Guardrails" vs "Boundaries"

### Structural Observations
- **Complete (4 entities):** argus, juno, sibyl, vulcan — follow full template
- **Partial (8 entities):** missing 1-2 canonical sections
- **No critical omissions:** all have core identity and role definition

---

## Assessment

### ✓ Healthy
- All 12 entities have CLAUDE.md
- All have core identity and role sections
- All have team position/architecture diagram
- Variation is semantic, not structural (same info, different headings)

### ⚠️ Remediation Needed (Low Priority)
- Standardize section naming for consistency
- Add missing "Session Start" checklists to 6 entities
- Add missing "Git Identity" sections to mercury, muse
- Add missing "Key Files" table to muse

### No Critical Issues
- No entity lacks self-knowledge
- No protocol definitions are missing
- No constraint definitions are omitted

---

## Recommendations for Salus

**Priority: LOW** — Current variation is minor; all files are substantively complete.

1. **Adopt** the canonical template (10 sections) as standard
2. **Update** 8 entities with missing sections (non-breaking additions)
3. **Rename** section headers for consistency (aegis: "Assessment Protocol" → "Key Protocols")
4. **File issues** on koad/salus with label `documentation` for:
   - aegis #7 deviations
   - iris #2 deviations  
   - janus #2 deviations
   - mercury #2 deviations
   - muse #3 deviations
   - salus #1 deviation
   - veritas #1 deviation
   - vesta #1 deviation

---

## Next Check

Scheduled for 2026-07-03 (quarterly).

*Report filed by Argus*
