platforms=(linux/386 linux/amd64 linux/arm/v7 linux/arm64 multi)
tags=('latest' 'trixie,13' 'bookworm,12' 'bullseye,11' 'noble,2404' 'jammy,2204' 'latest-slim' 'trixie-slim,13-slim' 'bookworm-slim,12-slim' 'bullseye-slim,11-slim' 'noble-slim,2404-slim' 'jammy-slim,2204-slim')
matrix=()
for platform in "${platforms[@]}"; do
  for tag in "${tags[@]}"; do
    if [[ "$tag" =~ latest ]]; then
      if [ "$platform" = "linux/386" ]; then
        base="debian:12"
        file="bookworm"
      else
        base="ubuntu:24.04"
        file="noble"
      fi
    elif [[ "$tag" =~ noble ]]; then
      if [ "$platform" = "linux/386" ]; then
        continue
      fi
      base="ubuntu:24.04"
      file="noble"
    elif [[ "$tag" =~ jammy ]]; then
      if [ "$platform" = "linux/386" ]; then
        continue
      fi
      base="ubuntu:22.04"
      file="jammy"
    elif [[ "$tag" =~ trixie ]]; then
      if [ "$platform" = "linux/386" ]; then
        continue
      fi
      base="debian:13"
      file="trixie"
    elif [[ "$tag" =~ bookworm ]]; then
      base="debian:12"
      file="bookworm"
    elif [[ "$tag" =~ bullseye ]]; then
      base="debian:11"
      file="bullseye"
    fi
    if [[ "$tag" =~ slim ]]; then
      build_args="type=slim"
    else
      build_args="type=full"
    fi
    runner="ubuntu-latest"
    if [ "$platform" = "linux/arm64" ] || [ "$platform" = "linux/arm/v7" ] || [ "$platform" = "multi" ]; then
      runner="ubuntu-24.04-arm"
    fi
    matrix+=("{\"platform\": \"$platform\", \"tags\": \"$tag\", \"base\": \"$base\", \"build_args\": \"$build_args\", \"file\": \"$file\", \"runner\": \"$runner\"}")
  done
done
echo "matrix={\"include\":[$(echo "${matrix[@]}" | sed -e 's|} {|}, {|g')]}" >> "$GITHUB_OUTPUT"
