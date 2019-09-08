#!/usr/bin/env bash
# REQUIRES 'git' and 'jq'

GITHUB_USERNAME=$1
PAGE_NUMBER=${2:-1}

JSON=$(curl "https://api.github.com/users/$GITHUB_USERNAME/repos?per_page=100&page=$PAGE_NUMBER" | jq -r ".[]") 

ORIGINAL=$(echo $JSON | jq -r 'select(.fork == false) | .name')
FORKED=$(echo $JSON | jq -r 'select(.fork == true) | .name') 

if [[ -n "$ORIGINAL" ]]; then
  mkdir -p "./$GITHUB_USERNAME/original" && cd "$GITHUB_USERNAME/original"
  echo $ORIGINAL | xargs -d' ' -I{} sh -c "git clone https://github.com/$GITHUB_USERNAME/{}"
  cd ../..
fi

if [[ -n "$FORKED" ]]; then
  mkdir -p "./$GITHUB_USERNAME/forked" && cd "$GITHUB_USERNAME/forked"
  echo $FORKED | xargs -d' ' -I{} sh -c "git clone https://github.com/$GITHUB_USERNAME/{}"
  cd ../..
fi  
