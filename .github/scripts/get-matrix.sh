set -euo pipefail

declare -A base_map=(
  [trixie]='debian:13'
  [bookworm]='debian:12'
  [bullseye]='debian:11'
  [noble]='ubuntu:24.04'
  [jammy]='ubuntu:22.04'
)

platforms=(linux/amd64 linux/arm/v7 linux/arm64 multi)

include_vendor="${INCLUDE_VENDOR:-}"

tag_specs=(
  "latest|noble|full|"
  "trixie,13|trixie|full|"
  "bookworm,12|bookworm|full|"
  "bullseye,11|bullseye|full|"
  "noble,2404,24.04|noble|full|"
  "jammy,2204,22.04|jammy|full|"
  "latest-slim|noble|slim|"
  "trixie-slim,13-slim|trixie|slim|"
  "bookworm-slim,12-slim|bookworm|slim|"
  "bullseye-slim,11-slim|bullseye|slim|"
  "noble-slim,2404-slim,24.04-slim|noble|slim|"
  "jammy-slim,2204-slim,22.04-slim|jammy|slim|"
)

php_versions=(5.6 7.0 7.1 7.2 7.3 7.4 8.0 8.1 8.2 8.3 8.4 8.5)
for php_version in "${php_versions[@]}"; do
  for distro in noble jammy trixie bookworm bullseye; do
    base="${base_map[$distro]}"
    vendor="${base%%:*}"
    version="${base#*:}"

    tags=("php-$php_version-$distro")
    if [ "$vendor" = "ubuntu" ]; then
      numeric_version="${version//./}"
      tags+=("php-$php_version-$numeric_version" "php-$php_version-$version")
    elif [ "$vendor" = "debian" ]; then
      tags+=("php-$php_version-$version")
    fi

    tag_specs+=("$(IFS=,; echo "${tags[*]}")|$distro|full|$php_version")
  done
done

matrix=()
for platform in "${platforms[@]}"; do
  for spec in "${tag_specs[@]}"; do
    IFS='|' read -r tag file build_type php_version <<< "$spec"
    base="${base_map[$file]}"
    vendor="${base%%:*}"

    if [ -n "$include_vendor" ] && [ "$vendor" != "$include_vendor" ]; then
      continue
    fi

    runner="ubuntu-latest"
    if [ "$platform" = "linux/arm64" ] || [ "$platform" = "linux/arm/v7" ] || [ "$platform" = "multi" ]; then
      runner="ubuntu-24.04-arm"
    fi

    php_build_arg=""
    if [ -n "$php_version" ]; then
      php_build_arg="PHP_VERSION=$php_version"
    fi

    build_args="type=$build_type"
    matrix+=("{\"platform\": \"$platform\", \"tags\": \"$tag\", \"base\": \"$base\", \"build_args\": \"$build_args\", \"file\": \"$file\", \"runner\": \"$runner\", \"php_build_arg\": \"$php_build_arg\"}")
  done
done

joined=$(printf '%s,' "${matrix[@]}")
echo "matrix={\"include\":[${joined%,}]}" >> "$GITHUB_OUTPUT"
