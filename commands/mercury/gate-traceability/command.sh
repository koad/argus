#!/usr/bin/env bash
# SPDX-License-Identifier: 0BSD
#
# Argus: Mercury Content Gate — Claim Traceability Verification
#
# Verifies that claims in Mercury drafts are traceable to context bubbles
# before allowing publication to OpenClaw.
#
# VESTA-SPEC-016 — Context bubbles provide the authoritative source for claims.
# VESTA-SPEC-014 — Peer ring visibility and sponsorship tier access.
#

set -euo pipefail

# Configuration
DRAFT=""
OUTPUT_FILE=""
VERBOSE=0
DRY_RUN=0

# Help
show_help() {
	cat <<EOF
Usage: argus mercury gate-traceability [OPTIONS]

Verify that claims in Mercury content are traceable to context bubbles.

OPTIONS:
  --draft <path>        Path to Mercury draft file (required)
  --output <file>       Write traceability report to file (optional)
  --verbose, -v         Verbose output (show all claims and checks)
  --dry-run             Run checks but don't modify anything
  --help                Show this help message

EXAMPLES:
  argus mercury gate-traceability --draft ~/mercury-drafts/2026-04-03-feature-launch.md
  argus mercury gate-traceability --draft ~/mercury-drafts/incident-report.md --output report.md --verbose

DESCRIPTION:
  This command is part of the Mercury gate protocol (memories/003-mercury-gate.md).
  It adds claim-traceability verification to the existing gate checklist:

  Mercury → [Existing gate checks] → Traceability check → GO/STOP/HOLD

  Workflow:
  1. Extract factual claims from Mercury content
     - Lines starting with '**' (bold claims)
     - Bullet points with verifiable assertions
     - Feature announcements, status updates, performance claims, etc.

  2. For each claim, search context bubbles from relevant entities
     - Query ~/.<entity>/bubbles/ for matching topic/tag
     - Look for moments where claim was formed, tested, or validated
     - Extract moment hash and session reference

  3. Verify claim scope
     - Does the claim match the bubble evidence scope?
     - Was the claim tested? (look for 'test' or 'correction' moment types)
     - Are there contradictions or caveats in the bubble?

  4. Gate decision
     - GO: All claims traced; scopes match; no contradictions
     - STOP: Claim untraced; scope mismatch; contradictions detected
     - HOLD: Bubble draft/unsigned; claim newer than bubbles; Veritas pending

  Gate decisions are logged to: reports/mercury-publish-log.md

CLAIM EXTRACTION HEURISTIC:
  - Lines matching: '** <claim>' (bold opening)
  - Lines matching: '- <claim>' (bullet with assertion verb: is, now, added, fixed, etc.)
  - Context types in bubbles: conclusion, test, correction
  - Topic matching: bubble topic must relate to claim domain

DEPENDENCIES:
  - VESTA-SPEC-016 (Context Bubble Protocol)
  - Entity bubble directories: ~/.<entity>/bubbles/
  - Existing Mercury gate (memories/003-mercury-gate.md)
  - Veritas fact-check system
  - bubble-daemon API (ETA 2026-04-10)

TODO:
  - [ ] Implement claim extraction heuristic (regex for bold, bullets)
  - [ ] Implement entity/topic inference from claim text (NLP or heuristic)
  - [ ] Implement bubble registry query (query all entity bubble dirs)
  - [ ] Implement moment hash extraction from bubbles
  - [ ] Implement claim-scope comparison logic
  - [ ] Implement contradiction detection (caveats, "except", "not", etc.)
  - [ ] Integrate with existing Mercury gate checklist
  - [ ] Add verifiable output (claim → bubble trace with moment hashes)
  - [ ] Add GitHub issue filing for STOP decisions (label: guardrails-stop-unverifiable)

GATE OUTPUT:
  Report format:
    Claim: <claim text>
    Status: TRACED | UNTRACED | CONTRADICTED
    Source bubble: <bubble-id> (topic: <topic>, moment: <moment-hash>)
    Evidence: <moment-description>
    Caveats: <any contradictions or scope mismatches>

EOF
}

# Parse arguments
while [[ $# -gt 0 ]]; do
	case "$1" in
		--draft)
			DRAFT="$2"
			shift 2
			;;
		--output)
			OUTPUT_FILE="$2"
			shift 2
			;;
		--verbose | -v)
			VERBOSE=1
			shift
			;;
		--dry-run)
			DRY_RUN=1
			shift
			;;
		--help)
			show_help
			exit 0
			;;
		*)
			echo "Error: unknown option '$1'" >&2
			show_help
			exit 1
			;;
	esac
done

# Validation
if [[ -z "$DRAFT" ]]; then
	echo "Error: --draft is required" >&2
	show_help
	exit 1
fi

if [[ ! -f "$DRAFT" ]]; then
	echo "Error: Draft file not found: $DRAFT" >&2
	exit 1
fi

# Main logic (scaffolded)
main() {
	local draft_name
	draft_name=$(basename "$DRAFT")

	echo "=== Argus: Mercury Content Gate — Claim Traceability ==="
	echo "Draft:   $draft_name"
	echo "Date:    $(date -u +%Y-%m-%dT%H:%M:%SZ)"
	echo "Mode:    $([ $DRY_RUN -eq 1 ] && echo "DRY-RUN" || echo "LIVE")"
	echo ""

	# Extract claims (scaffolded heuristic)
	echo "📋 Extracting claims from draft..."
	echo ""

	# TODO: Implement claim extraction heuristic
	#
	# Patterns to extract:
	#   1. Lines starting with '**' (bold claims)
	#      Regex: ^\*\*(.+?)\*\*
	#   2. Bullet points with assertion verbs
	#      Regex: ^- (is|now|added|fixed|supports|includes|integrates|deprecated).*
	#   3. Feature announcements
	#      Regex: Feature .* (now available|released|added)
	#   4. Status updates
	#      Regex: (Bug|Issue) .* (fixed|resolved|addressed)

	echo "Sample claim extraction logic (TODO):"
	echo ""
	echo "  # Extract bold claims"
	echo '  grep -oP '\''\*\*\K[^*]+(?=\*\*)'\'' "$DRAFT"'
	echo ""
	echo "  # Extract bullet claims with assertion verbs"
	echo '  grep -E '\''^-.*\b(is|now|added|fixed|supports)\b'\'' "$DRAFT"'
	echo ""

	if [[ $VERBOSE -eq 1 ]]; then
		echo "Draft preview (first 30 lines):"
		echo "---"
		head -30 "$DRAFT"
		echo "---"
		echo ""
	fi

	# TODO: Implement traceability check
	#
	# For each claim:
	#   1. Infer entity and topic from claim text (heuristic)
	#      Example: "Feature X now supports Y" → entity=vulcan, topic=features
	#
	#   2. Query bubble registry
	#      For each entity: find ~/.<entity>/bubbles/*.md
	#      Parse frontmatter to extract topic and tags
	#      Filter for matching topics/tags
	#
	#   3. Load matching bubbles
	#      Parse moments from markdown
	#      Look for context_type: test, correction, conclusion
	#
	#   4. Compare claim vs bubble evidence
	#      Extract claim scope from claim text
	#      Extract evidence scope from moment
	#      Flag if scope mismatch (claim overstated)
	#      Flag if contradictions found ("except X", "not Y", caveats)
	#
	#   5. Record trace
	#      Format: Claim → Bubble ID (moment-hash)
	#      Include evidence snippet
	#      Include any caveats

	echo "🔍 Traceability check: SCAFFOLDED"
	echo ""
	echo "Implementation pending:"
	echo "  • Claim extraction heuristic (regex patterns)"
	echo "  • Entity/topic inference from claim text"
	echo "  • Bubble registry query (all entity dirs)"
	echo "  • Moment hash extraction and verification"
	echo "  • Claim-scope comparison logic"
	echo "  • Contradiction detection (caveats, negations)"
	echo ""

	# Gate decision (scaffolded)
	echo "⚙️  Gate Decision: HOLD (pending implementation)"
	echo ""
	echo "Status: Implementation scaffolded"
	echo "Reason: Bubble registry API and claim extraction not yet implemented"
	echo ""

	# Output file (if requested)
	if [[ -n "$OUTPUT_FILE" && $DRY_RUN -eq 0 ]]; then
		cat > "$OUTPUT_FILE" <<REPORT
# Mercury Content Gate — Claim Traceability Report

**Draft:** $(basename "$DRAFT")
**Date:** $(date -u +%Y-%m-%dT%H:%M:%SZ)
**Auditor:** Argus

## Status

HOLD (Implementation scaffolded)

## Implementation Checklist

- [ ] Claim extraction heuristic
- [ ] Entity/topic inference
- [ ] Bubble registry query
- [ ] Moment verification
- [ ] Scope comparison logic
- [ ] Contradiction detection
- [ ] GitHub issue filing (for STOP)
- [ ] Publish log integration

## Reference

- VESTA-SPEC-016 (Context Bubble Protocol)
- memories/003-mercury-gate.md (Mercury gate protocol)
- features/context-bubble-content-gate.md (Feature design)

REPORT

		echo "✓ Report written to: $OUTPUT_FILE"
	fi

	echo ""
	echo "Next steps:"
	echo "  1. Implement claim extraction heuristic"
	echo "  2. Build bubble registry query logic"
	echo "  3. Implement claim-scope comparison"
	echo "  4. Integrate with existing Mercury gate"
	echo "  5. Test with sample Mercury drafts"
	echo ""
	echo "Reference: features/context-bubble-content-gate.md"
}

main "$@"
