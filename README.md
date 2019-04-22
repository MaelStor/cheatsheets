[![Build Status](https://travis-ci.com/MaelStor/cheatsheets.svg?branch=master)](https://travis-ci.com/MaelStor/cheatsheets)

# Kickstart Cheatsheets

Forked from the Kickstart Cheatsheets repo on github  
  (https://github.com/kickstartcoding/cheatsheets). All cheatsheets from Kickstart
  Coding can be found in the samples folder. I won't maintain them so if 
  you're searching for up-to-date versions look at their repo.

These cheatsheets are simple to edit in Markdown and then beatifully rendered
  to pdf and jpg via `latex` and `convert` from ImageMagick :)

## More

[More cheatsheets](./CHEATSHEETS.md)

# Contributing (originally from Kickstart)

* **How it's built**: These cheatsheets are written originally in Markdown,
  converted into LaTeX using [pandoc](https://pandoc.org/) and a custom
  [pandoc LaTeX template](./templates/template.tex) (very messy), and then
  generates the PDF.  All this is tied together using the Bash script
  [build.sh](./build.sh).

* **Writing your own**: Want to write your own printable coding cheatsheets?
  It's easy, as long as you know Markdown! Look at the existing `.md` source
  files for ideas, then follow the [DEVELOPMENT.md](./DEVELOPMENT.md) for
  instructions on how to re-build the PDFs yourself.

* **License**: The scripts involved with their build process are originally from
  (C) Kickstart Coding and released under the GPL 3.0.
