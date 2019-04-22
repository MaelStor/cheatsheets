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

  if [[ -f "$IN/$name.md" ]]; then
    in_path="$IN/$name.md"
  else
    this=$(basename "$0")
    printf "%s: File not found: %s" "$this" "${IN}/${name}"
    return 1
  fi

  out_name="${OUT}/${name}"

  #################################
  # Provides the option of selecting only certain cheatsheets
  # If we specify a path instead of a search param, lets check for that too (used by entr)
  if [[ "$FILTER" ]] && [[ ! $name == "$FILTER" ]] && [[ ! "$FILTER" -ef "$in_path" ]]; then
    return 1
  fi

  mkdir -p "$OUT"

  echo "${name}  ->  ${out_name}.pdf"

  pdf_engine_version="2.0.0" # this is the minimum version for --pdf-engine opt
  if pandoc --version | head -1 | sed -E 's/(pandoc) (.*)/\2/' \
    | paste -d'\n' - <(echo "$pdf_engine_version") | sort -V | tail -1 \
    | grep -q "$pdf_engine_version"; then
    pdf_opt='--latex-engine=pdflatex'
  else
    pdf_opt='--pdf-engine=pdflatex'
  fi

  pandoc \
    -f markdown \
    "$in_path" \
    --variable=cohort:"$COHORT" \
    -t latex \
    --template "$TEMPLATE" \
    "$pdf_opt" \
    -o "${out_name}.pdf" \
    --toc-depth 1 || return 1

  if [[ -x "$(command -v convert)" ]]; then
    convert "${out_name}.pdf" -background "#FFFFFF" -resize 350x -flatten "${out_name}.thumb.jpg" || return 1
    convert -density 300 "${out_name}.pdf" -resize 50% -flatten "${out_name}.jpg" || return 1
  fi

  ## Handle creating the LINKS.md markdown file (only when building all)
  if [[ -z "$FILTER" ]]; then
    cat << EOF >> "$LINKS_OUT"
### $name
[![$name PDF thumbnail](./${out_name}.thumb.jpg)](https://raw.githubusercontent.com/MaelStor/cheatsheets/master/${out_name}.pdf)

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
cheatsheets=(tmux)
for cheatsheet in "${cheatsheets[@]}"; do
  pandoc_build "$cheatsheet" || exit 1
done

exit 0
