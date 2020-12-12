local TILES = import './tiles.jsonnet';

{
  situations: [
    { // Door locked
      title: "Locked Door",
      description: TILES.scroll_door.locked,
      jumpTo: 19,
    },
    { // Unlockable
      title: "Weird Door, Weird Key",
      description: TILES.scroll_door.unlockable,
      nextQuestion: 11,
    },
    { // Unlocking procedure
      title: "Weird Unlock",
      description: TILES.scroll_door.unlocked[0],
      jumpTo: 23,
    },
    { // Unlocking procedure
      title: "Weird Unlock",
      description: TILES.scroll_door.unlocked[1],
      jumpTo: 24
    },
  ],
  questions: [
    {
      question: "What will you do?",
      options: [
        {
          opt: "Put the object in the hole.",
          setVariables: {
            hasOpenedScrollDoor: true
          },
          nextSituation: 22,
        },
        {
          opt: "Go back.",
          nextSituation: 19
        },
      ]
    },
  ],
}
