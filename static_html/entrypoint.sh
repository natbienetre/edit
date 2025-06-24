#!/usr/bin/env bash

set -e

cd /gitrepo

# Setup the repository
test -z "$1" || git remote set-url "$1" || git clone "$1" /gitrepo 

set -eu

# Update from origin
git reset --hard main
git pull --rebase origin main

echo "Updating using $SOURCE"

# Delete previously exported files
PREVIOUS_FILE=$(ls -1A | grep -vFy -f /build_files/built-in.grep)
test -n "$PREVIOUS_FILE" && rm -rf $PREVIOUS_FILE

cp -R "$SOURCE"/* ./

# move _redirects/index.html -> _redirects
mv _redirects/index.html _redirects.html
rmdir _redirects
mv _redirects.html _redirects

# move 404/index.html -> 404.html
mv 404/index.html 404.html
rmdir 404

# Apply additional replacements
find . -name '*.html' -exec \
    sed -i -f /sed_files/relative_url.sed {} \;
find . -name 'robots.txt' -or -name '*.xml' -exec \
    sed -i -f /sed_files/absolute_url.sed {} \;

# Push changes
git add .
git status
git commit --allow-empty -sm "generated($(date +%s))"
git push -f
