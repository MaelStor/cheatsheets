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
[![$name PDF thumbnail](./${out_name}.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/${out_name}.pdf)

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

COHORT="2019-Winter"
IN="kickstart-backend"
OUT="build/kickstart-backend"
pandoc_build "1-html-css"
pandoc_build "2-bash-git"
pandoc_build "3-python"
pandoc_build "4-modules-oop"
pandoc_build "5-http"
pandoc_build "6-django"
pandoc_build "7-orm"
pandoc_build "8-postgres"

IN="kickstart-frontend"
OUT="build/kickstart-frontend"
pandoc_build "1-css"
pandoc_build "2-javascript"
pandoc_build "3-react"
pandoc_build "4-components"
pandoc_build "5-mern"
pandoc_build "6-industry"
pandoc_build "7-algorithms"

IN="topical"
OUT="build/topical"
COHORT="Cheatsheet"
pandoc_build "javascript-for-pythonistas"
pandoc_build "python-for-js-developers"
pandoc_build "python"
pandoc_build "modern-html-css"
pandoc_build "django"
pandoc_build "cli-bash"
pandoc_build "react-redux"

exit 0
