for storyFile in $(ls stories/*.jsonnet);
do
  storyName=$(echo "$storyFile" | sed "s/\.jsonnet//")

  ./jsonnet/jsonnet "stories/$storyName.jsonnet" -o "stories/$storyName.json"
done
