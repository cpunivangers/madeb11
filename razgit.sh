# raz https://github.com/cpunivangers/madeb11

rm -rf .git
git init
git config user.email "christian.pottier@univ-angers.fr"
git config user.name "cpunivangers"
git remote add origin git@github.com:cpunivangers/madeb11.git
git add -A
git commit -m "raz"
git push -f origin main
