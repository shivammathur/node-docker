#!/usr/bin/env bash
set -euo pipefail

LATEST_LTS_VERSION=""
LATEST_ARM32_VERSION=""
LATEST_YARN_VERSION=""

CURRENT_NODE_VERSION=""
CURRENT_ARM32_VERSION=""
CURRENT_YARN_VERSION=""

NODE_VERSION_UPDATED=false
NODE_ARM32_UPDATED=false
YARN_VERSION_UPDATED=false

UPDATE_SUMMARY=""

fetch_latest_versions() {
  local release_index
  release_index=$(curl -sL https://nodejs.org/download/release/index.json)
  LATEST_LTS_VERSION=$(echo "$release_index" | jq -r '[.[] | select(.lts != false)] | first | .version | sub("^v"; "")')
  LATEST_ARM32_VERSION=$(echo "$release_index" | jq -r '[.[] | select(.version | test("^v22\\."))] | first | .version | sub("^v"; "")')
  LATEST_YARN_VERSION=$(curl -sSL --compressed https://yarnpkg.com/latest-version)
}

capture_current_versions() {
  CURRENT_NODE_VERSION=$(grep -m1 'ENV NODE_VERSION=' Dockerfile_bookworm | cut -d= -f2)
  CURRENT_ARM32_VERSION=$(grep -m1 'ENV NODE_VERSION_ARM32=' Dockerfile_bookworm | cut -d= -f2)
  CURRENT_YARN_VERSION=$(grep -m1 'ENV YARN_VERSION=' Dockerfile_bookworm | cut -d= -f2)
}

update_node_lts() {
  [ "$CURRENT_NODE_VERSION" != "$LATEST_LTS_VERSION" ] && NODE_VERSION_UPDATED=true
  for file in Dockerfile*; do sed -i "s/ENV NODE_VERSION=.*/ENV NODE_VERSION=$LATEST_LTS_VERSION/g" "$file"; done
}

update_node_arm32() {
  [ "$CURRENT_ARM32_VERSION" != "$LATEST_ARM32_VERSION" ] && NODE_ARM32_UPDATED=true
  for file in Dockerfile*; do sed -i "s/ENV NODE_VERSION_ARM32=.*/ENV NODE_VERSION_ARM32=$LATEST_ARM32_VERSION/g" "$file"; done
}

update_yarn_version() {
  [ "$CURRENT_YARN_VERSION" != "$LATEST_YARN_VERSION" ] && YARN_VERSION_UPDATED=true
  for file in Dockerfile*; do sed -i "s/ENV YARN_VERSION=.*/ENV YARN_VERSION=$LATEST_YARN_VERSION/g" "$file"; done
}

update_readme() {
  sed -i -E "s/- Node\.js [0-9]+\.[0-9]+\.[0-9]+, [0-9]+\.[0-9]+\.[0-9]+ \(armv7l\), ([0-9]+\.[0-9]+\.[0-9]+ \(x86\))/- Node.js $LATEST_LTS_VERSION, $LATEST_ARM32_VERSION (armv7l), \1/g" README.md
  sed -i -E "s/- Node\.js [0-9]+\.[0-9]+\.[0-9]+, ([0-9]+\.[0-9]+\.[0-9]+ \(x86\))/- Node.js $LATEST_LTS_VERSION, $LATEST_ARM32_VERSION (armv7l), \1/g" README.md
  sed -i -E "s/- Node\.js [0-9]+\.[0-9]+\.[0-9]+, [0-9]+\.[0-9]+\.[0-9]+ \(armv7l\)/- Node.js $LATEST_LTS_VERSION, $LATEST_ARM32_VERSION (armv7l)/g" README.md
  sed -i -E "s/- Node\.js [0-9]+\.[0-9]+\.[0-9]+$/- Node.js $LATEST_LTS_VERSION, $LATEST_ARM32_VERSION (armv7l)/g" README.md
  sed -i -E "s/Yarn [0-9]+\.[0-9]+\.[0-9]+/Yarn $LATEST_YARN_VERSION/g" README.md
}

build_summary() {
  local updates=()
  [ "$NODE_VERSION_UPDATED" = true ] && updates+=("Node.js $LATEST_LTS_VERSION")
  [ "$NODE_ARM32_UPDATED" = true ] && updates+=("Node.js $LATEST_ARM32_VERSION (armv7l)")
  [ "$YARN_VERSION_UPDATED" = true ] && updates+=("Yarn $LATEST_YARN_VERSION")

  local count=${#updates[@]}
  if [ "$count" -eq 0 ]; then UPDATE_SUMMARY="dependencies"; return; fi
  if [ "$count" -eq 1 ]; then UPDATE_SUMMARY="${updates[0]}"; return; fi
  if [ "$count" -eq 2 ]; then UPDATE_SUMMARY="${updates[0]} and ${updates[1]}"; return; fi

  local last=$((count - 1))
  local prefix=""
  for value in "${updates[@]:0:last}"; do prefix+="$value, "; done
  UPDATE_SUMMARY="${prefix%, } and ${updates[last]}"
}

write_outputs() {
  local message="Bump $UPDATE_SUMMARY"
  [ -z "${GITHUB_OUTPUT:-}" ] && return
  printf 'version=%s\n' "$LATEST_LTS_VERSION" >> "$GITHUB_OUTPUT"
  printf 'commit_message=%s\n' "$message" >> "$GITHUB_OUTPUT"
  printf 'pr_title=%s\n' "$message" >> "$GITHUB_OUTPUT"
}

fetch_latest_versions
capture_current_versions
update_node_lts
update_node_arm32
update_yarn_version
update_readme
build_summary
write_outputs
