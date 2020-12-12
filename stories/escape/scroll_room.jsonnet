local TILES = import './tiles.jsonnet';

{
  situations: [
    { // Scroll room; scroll available
      title: "Scary Room",
      description: TILES.scroll_room.available[0],
      jumpTo: 25
    },
    { // Scroll room; scroll available
      title: "Scary Room",
      description: TILES.scroll_room.available[1],
      nextQuestion: 12
    },
    { // Scroll room; scroll unavailable
      title: "A Scary Revisit",
      description: TILES.scroll_room.unavailable,
      jumpTo: 19
    },
    { // Scroll contents
      title: "Old Ink",
      description: TILES.scroll_room.scroll_contents[0],
      jumpTo: 28
    },
    { // Scroll contents
      title: "Old Ink",
      description: TILES.scroll_room.scroll_contents[1],
      jumpTo: 29
    },
    { // Scroll contents
      title: "Old Ink",
      description: TILES.scroll_room.scroll_contents[2],
      jumpTo: 30
    },
    { // Scroll contents
      title: "Old Ink",
      description: TILES.scroll_room.scroll_contents[3],
      jumpTo: 31
    },
    { // End of scroll reading
      title: "Riddle",
      description: "A riddle... What could it mean? Weights... You went back.",
      jumpTo: 19
    },
  ],
  questions: [
    {
      question: "What will you do?",
      options: [
        {
          opt: "Pick up the kit and go back.",
          setVariables: {
            hasScroll: true
          },
          nextSituation: 27,
        },
        {
          opt: "Go back.",
          nextSituation: 19,
        },
      ],
    },
  ]
}
