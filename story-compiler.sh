for storyFile in $(ls stories);
do
  storyName=$(echo "$storyFile" | sed "s/\.jsonnet//")

  ./jsonnet/jsonnet "stories/$storyName.jsonnet" -o "stories/$storyName.json"
done
