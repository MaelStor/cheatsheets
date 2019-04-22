#!/bin/bash

###############
# Ensure in correct location
MY_PATH=$(dirname "$0")             # relative
MY_PATH=$(readlink -e "$MY_PATH") # absolutized and normalized
cd "$MY_PATH" || exit 1
###############

TEMPLATE="$MY_PATH/templates/cheatsheet.latex"

FILTER="$1"
FILTER_ARG="$2"

LINKS_OUT="CHEATSHEETS.md"

function pandoc_build() {
  local name
  name="$1"

  in_path="$IN/$name.md"
  out_name="${OUT}/${name}"

  #################################
  # Provides the option of selecting only certain cheatsheets
  # If we specify a path instead of a search param, lets check for that too (used by entr)
  if [[ "$FILTER" ]] && [[ ! $name == "$FILTER" ]] && [[ ! "$FILTER" -ef "$in_path" ]]; then
    return 1
  fi

  mkdir -p "$OUT"

  echo "${name}  ->  ${out_name}.pdf"
  pandoc \
    -f markdown \
    "$in_path" \
    --variable=cohort:"$COHORT" \
    -t latex \
    --template "$TEMPLATE" \
    --pdf-engine='pdflatex' \
    -o "${out_name}.pdf" \
    --toc-depth 1

  if [[ -x "$(command -v convert)" ]]; then
    convert "${out_name}.pdf" -background "#FFFFFF" -resize 350x -flatten "${out_name}.thumb.jpg"
    convert -density 300 "${out_name}.pdf" -resize 50% -flatten "${out_name}.jpg"
  fi

  ## Handle creating the LINKS.md markdown file (only when building all)
  if [[ -z "$FILTER" ]]; then
    cat << EOF >> "$LINKS_OUT"
### $name
[![$name PDF thumbnail](./${out_name}.thumb.jpg)](https://github.com/MaelStor/cheatsheets/raw/master/${out_name}.pdf)

EOF
  fi

  return 0
}

if [[ "$FILTER" ]] && [[ $FILTER == "--watch" ]]; then
  if [[ "$FILTER_ARG" ]]; then
    dir=$(dirname "$FILTER_ARG")
    file=$(basename "$FILTER_ARG")
    echo "Entering watch mode..."
    find "$dir" -name "${file}.md" | entr -p ./build.sh /_
    exit
  fi
fi

## Handle creating the LINKS.md markdown file (only when building all)
if [[ -z "$FILTER" ]]; then
  echo   "
# Cheatsheets

Click on one of the following thumbnails to download one of our cheatsheets.

" > "$LINKS_OUT"
fi

IN="cheatsheets"
OUT="build/cheatsheets"
COHORT="Cheatsheet"
pandoc_build "tmux"

exit 0
