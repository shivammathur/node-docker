
LATEST_LTS_VERSION=$(curl -sL https://nodejs.org/download/release/index.json | jq -r '[.[] | select(.lts != false)] | first | .version | sub("^v"; "")')
for file in Dockerfile*; do
    sed -i "s/ENV NODE_VERSION .*/ENV NODE_VERSION $LATEST_LTS_VERSION/g" "$file"
done
sed -i "s/Node.js [0-9]*\.[0-9]*\.[0-9]*/Node.js $LATEST_LTS_VERSION/g" README.md
echo "version=$LATEST_LTS_VERSION" >> $GITHUB_OUTPUT
