for storyFile in $(ls stories/*.jsonnet);
do
  storyName=$(echo "$storyFile" | sed "s/\.jsonnet//")

  ./jsonnet/jsonnet "$storyName.jsonnet" -o "$storyName.json"
done
