local TILES = import './tiles.jsonnet';
local FUNCTIONS = import './functions.libsonnet';


local directionOpt = FUNCTIONS.directionOpt;
local junctionQuestion = FUNCTIONS.junctionQuestion;
local junctionSituation = FUNCTIONS.junctionSituation;

{
  situations: [
    {
      title: "A key to...",
      description: TILES.key.lying,
      nextQuestion: 8
    },
    {
      title: "Hunt for Keyhole",
      description: TILES.key.picked + " You went back to the last junction.",
      setVariables: {
        hasKey: true,
      },
      jumpTo: 12
    },
    {
      title: "One Key Only",
      description: TILES.key.already_picked + " You went back.",
      jumpTo: 12
    },
  ],
  questions: [
    {
      question: "What will you do?",
      options: [
        {
          opt: "Pick up the key.",
          nextSituation: 15
        },
        {
          opt: "Go back left.",
          nextSituation: 12
        },
      ]
    },
  ]
}
