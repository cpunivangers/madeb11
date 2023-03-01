#!/bin/bash

# raz https://github.com/cpunivangers/madeb11
VERSION=11.$(date +%y%m%d.%H%M)

rm -rf .git
git init
git config user.email "christian.pottier@univ-angers.fr"
git config user.name "cpunivangers"
git remote add origin git@github.com:cpunivangers/madeb11.git
git add -A
git commit -m "Version $VERSION"
git push -f origin main
git tag -a $VERSION -m "Version $VERSION"
git push origin $VERSION
#~ git release $VERSION -c
echo "$VERSION" > Version.txt
