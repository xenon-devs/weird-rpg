local CHARACTERS = {
  main: "Sammy"
};

local TILES = import './escape/tiles.jsonnet';
local LOCKED_BOX = import './escape/locked-box.jsonnet';
local FUNCTIONS = import './escape/functions.libsonnet';


local directionOpt = FUNCTIONS.directionOpt;
local junctionQuestion = FUNCTIONS.junctionQuestion;
local junctionSituation = FUNCTIONS.junctionSituation;

// NOTE: Some question options redirect to -1, those are incomplete questions
{
  name: "%s's Escape"%CHARACTERS.main,
  author: "ShadowWarriorPro",
  description: "%s is stuck in a dark dungeon. He has to escape with limited food, a dying lamp and hidden clues with no map."%CHARACTERS.main,
  variables: { // Inventory
    hasKey: false,
    hasMysteriousWeight: false,
    hasScroll: false
  },
  situations: [
    {
      title: "Claustrophobia",
      description: |||
        You are %s who is stuck in a dark dungeon with low walls and thin passages. You don't remember anything that happened before.
        Some incident knocked you off, and you woke up in this dark, scary place.
      |||%CHARACTERS.main,
      jumpTo: 1
    },
    {
      title: "Limted Resources",
      description: |||
        There are faint lamps everywhere with limited oil.
        You found food and water next to you, but very little. You picked up one of the lamps from its stand, packed the food in your bag, and started exploring
        with (very little) hope to survive. You don't have a map of the place. All corridors look alike and you have no idea which monsters are waiting to eat you up.
      |||,
      jumpTo: 2
    },
    junctionSituation(['D', 'R'], 0), // Tile 2x2 (starting tile)
    junctionSituation(['D', 'L'], 1), // Tile 2x4
    junctionSituation(['D', 'R', 'U'], 2), // Tile 5x2
    { // Tile 5x3; Trap
      title: "Trap",
      description: TILES.traps[2],
      nextQuestion: -1
    },
    junctionSituation(['D', 'R', 'U'], 3), // Tile 6x2
    LOCKED_BOX.situations[0],
    LOCKED_BOX.situations[1],
    LOCKED_BOX.situations[2],
    LOCKED_BOX.situations[3],
    LOCKED_BOX.situations[4],
    junctionSituation(['R', 'U', 'L'], -1), // Tile 8x6; Trap above, key to the right
    { // Tile 7x6; Trap
      title: "Trap",
      description: TILES.traps[0],
      nextQuestion: -1
    },
  ],
  questions: [
    junctionQuestion([directionOpt('D', 4), directionOpt('R', 3)]), // Tile 2x2 (starting tile); Down goes directly to 5x2
    junctionQuestion([directionOpt('D', -1), directionOpt('L', 2)]), // Tile 2x4;
    junctionQuestion([directionOpt('D', 6), directionOpt('R', 5), directionOpt('U', 2)]), // Tile 5x2; Trap to the right
    junctionQuestion(
      [
        directionOpt(
          'D', 7,
          [
            {
              condition: {variables: {hasMysteriousWeight: true}},
              nextSituation: 10,
            },
            {
              condition: {variables: {hasMysteriousWeight: false}},
              nextSituation: 7,
            },
          ]
        ), // Should go to unlocked or locked box, so conditional
        directionOpt('R', -1),
        directionOpt('U', 4)
      ]
    ), // Tile 6x2
    LOCKED_BOX.questions[0],
    LOCKED_BOX.questions[1],
    LOCKED_BOX.questions[2],
    junctionQuestion(
      [
        directionOpt('R', -1),
        directionOpt('U', 13),
        directionOpt(
          'L', 7,
          [
            {
              condition: {variables: {hasMysteriousWeight: true}},
              nextSituation: 10,
            },
            {
              condition: {variables: {hasMysteriousWeight: false}},
              nextSituation: 7,
            },
          ]
        ) // Should go to unlocked or locked box, so conditional
      ]
    ) // Tile 8x6
  ]
}
