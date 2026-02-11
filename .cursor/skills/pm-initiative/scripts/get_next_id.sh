#!/bin/bash
# Get the next available ID for a document type
# Usage: ./get_next_id.sh [initiative|experiment|prd|charter]

TYPE="${1:-initiative}"
YEAR="2026"

case "$TYPE" in
  initiative)
    PREFIX="I"
    DIR="initiatives/$YEAR"
    ;;
  experiment)
    PREFIX="E"
    DIR="experiments/$YEAR"
    ;;
  prd)
    PREFIX="PRD"
    DIR="prds/active"
    ;;
  charter)
    PREFIX="TC"
    DIR="team-charters"
    ;;
  *)
    echo "Unknown type: $TYPE"
    exit 1
    ;;
esac

# Find highest existing ID
if [ "$TYPE" = "charter" ]; then
  PATTERN="$PREFIX-[0-9]*.md"
  HIGHEST=$(ls "$DIR"/$PATTERN 2>/dev/null | sed "s/.*$PREFIX-//" | sed 's/-.*//' | sort -n | tail -1)
else
  PATTERN="$PREFIX-$YEAR-[0-9]*.md"
  HIGHEST=$(ls "$DIR"/$PATTERN 2>/dev/null | sed "s/.*$PREFIX-$YEAR-//" | sed 's/\.md//' | sort -n | tail -1)
fi

# Default to 0 if none exist
HIGHEST=${HIGHEST:-0}

# Increment
NEXT=$((HIGHEST + 1))

# Format with leading zeros
if [ "$TYPE" = "charter" ]; then
  printf "$PREFIX-%03d\n" $NEXT
else
  printf "$PREFIX-$YEAR-%03d\n" $NEXT
fi
