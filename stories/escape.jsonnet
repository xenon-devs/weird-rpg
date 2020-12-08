local CHARACTERS = {
  main: "Sammy"
};

local TILES = import './escape/tiles.jsonnet';
local DIRECTIONS = import './escape/directions.jsonnet';
local DIRECTIONS_GO = import './escape/directions-go.jsonnet';

local directionOpt(dir, nextSituation, conditionalNext = []) = {
  opt: DIRECTIONS_GO[dir],
  nextSituation: nextSituation,
  conditionalNext: conditionalNext
};

local junctionQuestion(options) = {
  question: "What will you do?",
  options: options
};

local junctionSituation(directions, nextQuestion) = {
  title: "Junction",
  description: std.join('\n', ["%s" % DIRECTIONS[x], for x in directions]) + "\n All directions are shown assuming you are looking at the 2D map from above.",
  nextQuestion: nextQuestion
};

{
  name: "%s's Escape"%CHARACTERS.main,
  author: "ShadowWarriorPro",
  description: "%s is stuck in a dark dungeon. He has to escape with limited food, a dying lamp and hidden clues with no map."%CHARACTERS.main,
  variables: { // Inventory
    hasKey: false,
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
  ],
  questions: [
    junctionQuestion([directionOpt('D', 4), directionOpt('R', 3)]), // Tile 2x2 (starting tile); Down goes directly to 5x2
    junctionQuestion([directionOpt('D', 1), directionOpt('L', 2)]), // Tile 2x4;
    junctionQuestion([directionOpt('D', 6), directionOpt('R', 5), directionOpt('U', 2)]), // Tile 5x2; Trap to the right
    junctionQuestion([directionOpt('D', 7), directionOpt('R', 1), directionOpt('U', 4)]), // Tile 6x2
    { // Tile 8x2; Locked Box
      question: "What will you do?",
      options: [
        directionOpt('R', 1),
        directionOpt('U', 1),
        {
          opt: "Open the box",
          nextSituation: 8,
          conditionalNext: [
            {
              condition: {
                variables: {
                  hasKey: false
                }
              },
              nextSituation: 8
            },
          ]
        },
      ],
    },
  ]
}
