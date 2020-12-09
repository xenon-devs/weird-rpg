local TILES = import './tiles.jsonnet';
local FUNCTIONS = import './functions.libsonnet';


local directionOpt = FUNCTIONS.directionOpt;
local junctionQuestion = FUNCTIONS.junctionQuestion;
local junctionSituation = FUNCTIONS.junctionSituation;

{
  situations: [
    { // Tile 8x2; Locked box
      title: "Mysterious Box",
      description: "You found a mysterious, old box lying here.",
      nextQuestion: 4
    },
    { // Box is locked
      title: "Locked",
      description: TILES.locked_box.locked,
      nextQuestion: 4
    },
    { // Box is unlockable
      title: "Box and Key?",
      description: TILES.locked_box.unlockable,
      nextQuestion: 5
    },
    { // Box has already been unlocked
      title: "Unlocked Box",
      description: TILES.locked_box.unlocked,
      nextQuestion: 6
    },
    { // Box unlocking
      title: "What's inside?",
      description: TILES.locked_box.contents,
      nextQuestion: 6,
      setVariables: {
        hasMysteriousWeight: true
      }
    }
  ],
  questions: [
    { // Tile 8x2; Locked Box
      question: "What will you do?",
      options: [
        directionOpt('R', 12),
        directionOpt('U', 6),
        {
          opt: "Open the box.",
          nextSituation: 8,
          conditionalNext: [
            {
              condition: {variables: {hasKey: false}},
              nextSituation: 8
            },
            {
              condition: {variables: {hasKey: true}},
              nextSituation: 9
            },
          ]
        },
      ],
    },
    { // Tile 8x2; Unlockable Box
      question: "What will you do?",
      options: [
        directionOpt('R', 12),
        directionOpt('U', 6),
        {
          opt: "Unlock the box.",
          nextSituation: 11
        },
      ],
    },
    junctionQuestion([directionOpt('U', 6), directionOpt('R', 12)]) // Tile 8x2; Already unlocked box
  ]
}
