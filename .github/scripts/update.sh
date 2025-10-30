RELEASE_INDEX=$(curl -sL https://nodejs.org/download/release/index.json)
LATEST_LTS_VERSION=$(echo "$RELEASE_INDEX" | jq -r '[.[] | select(.lts != false)] | first | .version | sub("^v"; "")')
LATEST_ARM32_VERSION=$(echo "$RELEASE_INDEX" | jq -r '[.[] | select(.version | test("^v22\\."))] | first | .version | sub("^v"; "")')
for file in Dockerfile*; do
    sed -i "s/ENV NODE_VERSION=.*/ENV NODE_VERSION=$LATEST_LTS_VERSION/g" "$file"
    sed -i "s/ENV NODE_VERSION_ARM32=.*/ENV NODE_VERSION_ARM32=$LATEST_ARM32_VERSION/g" "$file"
done
sed -i -E "s/- Node\.js [0-9]+\.[0-9]+\.[0-9]+, [0-9]+\.[0-9]+\.[0-9]+ \(armv7l\), ([0-9]+\.[0-9]+\.[0-9]+ \(x86\))/- Node.js $LATEST_LTS_VERSION, $LATEST_ARM32_VERSION (armv7l), \1/g" README.md
sed -i -E "s/- Node\.js [0-9]+\.[0-9]+\.[0-9]+, ([0-9]+\.[0-9]+\.[0-9]+ \(x86\))/- Node.js $LATEST_LTS_VERSION, $LATEST_ARM32_VERSION (armv7l), \1/g" README.md
sed -i -E "s/- Node\.js [0-9]+\.[0-9]+\.[0-9]+, [0-9]+\.[0-9]+\.[0-9]+ \(armv7l\)/- Node.js $LATEST_LTS_VERSION, $LATEST_ARM32_VERSION (armv7l)/g" README.md
sed -i -E "s/- Node\.js [0-9]+\.[0-9]+\.[0-9]+$/- Node.js $LATEST_LTS_VERSION, $LATEST_ARM32_VERSION (armv7l)/g" README.md
if [ -n "$GITHUB_OUTPUT" ]; then
    echo "version=$LATEST_LTS_VERSION" >> "$GITHUB_OUTPUT"
fi
