#!/usr/bin/env bash
# Concatenates the documents a Claude Design session needs into one file,
# docs/DESIGN-PACK.md, in the order the design brief's starter prompt names.
# Regenerate after editing any source doc:  bash scripts/build-design-pack.sh
set -euo pipefail
cd "$(dirname "$0")/.."
OUT=docs/DESIGN-PACK.md
FILES=(docs/DESIGN-BRIEF.md docs/SITE-SPEC.md docs/LISTS.md docs/SIGN-ON-PROMPT.md docs/MEMBERSHIP.md docs/GUIDELINES.md docs/MISSION-STATEMENT.md CLAUDE.md docs/OPEN-DECISIONS.md)
{
  echo "# Brainstorm Cafe — Design Pack"
  echo
  echo "> Generated $(date -u +%Y-%m-%d) by \`scripts/build-design-pack.sh\` from commit $(git rev-parse --short HEAD). One file for a Claude Design session, containing, in order: ${FILES[*]}. Do not edit here; edit the sources and regenerate. Relative links inside refer to the repository at https://github.com/nous-clawds4/trusted-agents."
  echo
  echo "## Contents"
  echo
  for f in "${FILES[@]}"; do echo "- $f"; done
  for f in "${FILES[@]}"; do
    echo; echo; echo "---"; echo; echo "<!-- ===== BEGIN $f ===== -->"; echo
    cat "$f"
    echo; echo "<!-- ===== END $f ===== -->"
  done
} > "$OUT"
echo "wrote $OUT ($(wc -l < "$OUT") lines, $(wc -c < "$OUT") bytes)"
