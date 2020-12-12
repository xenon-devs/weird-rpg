local TILES = import './tiles.jsonnet';
local FUNCTIONS = import './functions.libsonnet';

local digitQuestion = FUNCTIONS.digitQuestion;

{
  situations: [
    { // Locked Door; Not unlockable
      title: "Door With No Lock",
      description: TILES.exit_door[0],
      jumpTo: 33
    },
    { // Locked Door; Not unlockable
      title: "Door With No Lock",
      description: TILES.exit_door[1],
      jumpTo: 34
    },
    { // Locked Door; Not unlockable
      title: "Now Way to Open the Door",
      description: |||
        You had no idea what to do. The door cannot be opened with what you already have.
        You went back to find more clues.
      |||,
      jumpTo: 3 // Back to tile 3x5
    },
    { // Locked Door; Unlockable
      title: "Door With No Lock",
      description: TILES.exit_door[0],
      jumpTo: 36
    },
    { // Locked Door; Unlockable
      title: "Door With No Lock",
      description: TILES.exit_door[1],
      jumpTo: 37
    },
    { // Locked Door; Unlockable
      title: "How to Open the Door?",
      description: |||
        The door has no lock. Perhaps the scroll has some clue about how to open it.
        Perhaps the weights will help. Or is there another clue?
      |||,
      nextQuestion: 13
    },
    { // Scroll reading
      title: "Old Ink",
      description: TILES.scroll_room.scroll_contents[0],
      jumpTo: 39
    },
    { // Scroll reading
      title: "Old Ink",
      description: TILES.scroll_room.scroll_contents[1],
      jumpTo: 40
    },
    { // Scroll reading
      title: "Old Ink",
      description: TILES.scroll_room.scroll_contents[2],
      jumpTo: 41
    },
    { // Scroll reading
      title: "Old Ink",
      description: TILES.scroll_room.scroll_contents[3],
      nextQuestion: 13
    },
    { // Digit 1
      title: "Weights on Platforms",
      description: "First platform. Weights are numbered from 1 to 9.",
      nextQuestion: 14
    },
    { // Digit 2
      title: "Weights on Platforms",
      description: "First platform. Weights are numbered from 1 to 9.",
      nextQuestion: 15
    },
    { // Digit 3
      title: "Weights on Platforms",
      description: "First platform. Weights are numbered from 1 to 9.",
      nextQuestion: 16
    },
    { // Digit 4
      title: "Weights on Platforms",
      description: "First platform. Weights are numbered from 1 to 9.",
      nextQuestion: 17
    },
    { // Code did not work
      title: "Nothing Happened",
      description: "You placed all the 4 weights. The platforms went down but nothing happened.",
      nextQuestion: 13
    }
  ],
  questions: [
    { // Options
      question: "What will you do?",
      options: [
        {
          opt: "Read the scroll.",
          nextSituation: 38
        },
        {
          opt: "Try placing weights on the platforms.",
          nextSituation: 42
        },
        {
          opt: "Go back.",
          nextSituation: 3 // Back to tile 3x5
        },
      ]
    },
    digitQuestion('1', 43),
    digitQuestion('2', 44),
    digitQuestion('3', 45),
    digitQuestion('4', 46, [
      {condition: {variables: {digit1: 3, digit2: 1, digit3: 4, digit4: 1}}, nextSituation: 47}
    ])
  ],
}
