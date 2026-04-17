#!/usr/bin/env bash
# SPDX-License-Identifier: 0BSD
#
# Argus: Context Bubble Entity Behavior Audit
#
# Audits an entity's behavior against a declared spec by analyzing session records
# (context bubbles) and checking whether actual behavior matches spec requirements.
#
# VESTA-SPEC-016 — Context bubbles are the authoritative source for entity behavior.
#

set -euo pipefail

# Configuration
ENTITY=""
SPEC=""
VERBOSE=0
REPAIR=0

# Help
show_help() {
	cat <<EOF
Usage: argus audit entity-behavior [OPTIONS]

Audit an entity's behavior against a spec using context bubbles as authoritative records.

OPTIONS:
  --entity <name>       Entity name (required). Example: vesta, vulcan, salus
  --spec <SPEC-ID>      Spec ID to audit against (required). Example: VESTA-SPEC-016
  --verbose, -v         Verbose output (show all checks)
  --repair              Attempt to repair deviations (requires admin approval)
  --help                Show this help message

EXAMPLES:
  argus audit entity-behavior --entity vesta --spec VESTA-SPEC-006
  argus audit entity-behavior --entity vulcan --spec VESTA-SPEC-009 --verbose

DESCRIPTION:
  This command:
  1. Loads context bubbles from ~/{entity}/bubbles/
  2. Loads the spec from ~/.vesta/specs/
  3. Extracts moments from bubbles and classifies behavior
  4. Compares declared behavior against spec requirements
  5. Outputs conformance status: PASS | DRIFT | FAIL with specifics

  Moment classification uses context_type from VESTA-SPEC-016:
  - input: question or problem posed
  - discovery: new information found
  - hypothesis: theory formed
  - test: idea tried
  - failure: something didn't work
  - correction: previous understanding was wrong
  - conclusion: final decision reached

DEPENDENCIES:
  - VESTA-SPEC-016 (Context Bubble Protocol)
  - Entity bubble directory: ~/{entity}/bubbles/
  - Spec file: ~/.vesta/specs/{SPEC-ID}.md
  - Bubble registry API (2026-04-10)

TODO:
  - [ ] Implement bubble registry query API (depends on bubble-daemon endpoint)
  - [ ] Implement moment extraction from bubble markdown
  - [ ] Implement behavior classifier (context_type → behavior description)
  - [ ] Implement spec requirement parser
  - [ ] Implement conformance comparison logic
  - [ ] Add repair mode (requires admin approval)
  - [ ] Add verifiable output (moment hashes in report)

EOF
}

# Parse arguments
while [[ $# -gt 0 ]]; do
	case "$1" in
		--entity)
			ENTITY="$2"
			shift 2
			;;
		--spec)
			SPEC="$2"
			shift 2
			;;
		--verbose | -v)
			VERBOSE=1
			shift
			;;
		--repair)
			REPAIR=1
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
if [[ -z "$ENTITY" ]]; then
	echo "Error: --entity is required" >&2
	show_help
	exit 1
fi

if [[ -z "$SPEC" ]]; then
	echo "Error: --spec is required" >&2
	show_help
	exit 1
fi

# Main logic (scaffolded)
main() {
	local bubble_dir="$HOME/.${ENTITY}/bubbles"
	local spec_file="$HOME/.vesta/specs/${SPEC}.md"

	echo "=== Argus: Entity Behavior Audit ==="
	echo "Entity:  $ENTITY"
	echo "Spec:    $SPEC"
	echo "Date:    $(date -u +%Y-%m-%dT%H:%M:%SZ)"
	echo ""

	# Check bubble directory exists
	if [[ ! -d "$bubble_dir" ]]; then
		echo "⚠ Warning: Bubble directory not found: $bubble_dir"
		echo "Status: UNAUDITABLE (no session records available)"
		echo ""
		echo "Recommendation: Create context bubbles for $ENTITY to enable behavior auditing."
		echo "Reference: VESTA-SPEC-016 §3 (Bubble Creation and Curation)"
		exit 0
	fi

	# Check spec file exists
	if [[ ! -f "$spec_file" ]]; then
		echo "✗ Error: Spec file not found: $spec_file"
		exit 1
	fi

	# TODO: Implement the actual audit logic
	#
	# 1. Query bubble registry for bubbles created by or referencing the entity
	#    (depends on bubble-daemon API available 2026-04-10)
	#
	# 2. Filter bubbles by topic matching spec domain (e.g., "daemon-specification" for VESTA-SPEC-009)
	#
	# 3. Load each bubble and extract moments
	#
	# 4. For each moment in the bubble:
	#    - Classify as input/discovery/hypothesis/test/failure/correction/conclusion
	#    - Extract behavior description from moment content
	#    - Compare against spec requirements section
	#    - Flag deviations or contradictions
	#
	# 5. Aggregate conformance status across all moments
	#    - PASS: all moments conform to spec
	#    - DRIFT: some moments deviation (documented but non-critical)
	#    - FAIL: critical contradictions between behavior and spec
	#
	# 6. Generate report with:
	#    - Conformance status
	#    - Citation to specific moment hashes (verifiable)
	#    - Deviation details
	#    - Recommended actions

	echo "Bubbles found:"
	if [[ -d "$bubble_dir" ]]; then
		find "$bubble_dir" -maxdepth 1 -name "*.md" -type f | while read -r bubble; do
			basename "$bubble"
		done
	fi
	echo ""

	echo "📋 Audit Status: SCAFFOLDED"
	echo ""
	echo "Implementation pending:"
	echo "  • Bubble registry query API (koad/bubble-daemon, ETA 2026-04-10)"
	echo "  • Moment extraction heuristic"
	echo "  • Behavior classifier"
	echo "  • Conformance comparison logic"
	echo ""

	if [[ $VERBOSE -eq 1 ]]; then
		echo "Debug: Spec content (first 500 chars):"
		head -c 500 "$spec_file"
		echo ""
		echo ""
	fi

	echo "Next steps:"
	echo "  1. Implement bubble-daemon API endpoints (per VESTA-SPEC-016 §9)"
	echo "  2. Build moment extraction and behavior classifier"
	echo "  3. Parse spec requirements from markdown"
	echo "  4. Run audit to generate conformance report"
	echo ""
	echo "Reference: features/context-bubble-entity-audit.md"
}

main "$@"
