local CHARACTERS = {
  main: "Sammy"
};

local FUNCTIONS = import './escape/functions.libsonnet';
local TILES = import './escape/tiles.jsonnet';
local LOCKED_BOX = import './escape/locked-box.jsonnet';
local KEY = import './escape/key.jsonnet';
local SCROLL_DOOR = import './escape/scroll-door.jsonnet';
local SCROLL_ROOM = import './escape/scroll-room.jsonnet';
local EXIT_DOOR = import './escape/exit-door.jsonnet';

local directionOpt = FUNCTIONS.directionOpt;
local junctionQuestion = FUNCTIONS.junctionQuestion;
local junctionSituation = FUNCTIONS.junctionSituation;

// NOTE: Some question options redirect to -1, those are incomplete questions
{
  name: "%s's Escape"%CHARACTERS.main,
  author: "ShadowWarriorPro",
  description: "%s is stuck in a dark dungeon. He has to escape with limited food, a dying lamp and hidden clues with no map. Find keys, open doors, solve puzzles and avoid traps."%CHARACTERS.main,
  variables: { // Inventory
    hasKey: false,
    hasMysteriousWeight: false,
    hasOpenedScrollDoor: false,
    hasScroll: false,
    digit1: 0,
    digit2: 0,
    digit3: 0,
    digit4: 0,
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

        NOTE FOR PLAYER: You may not be able to escape in the first try. Use a pen and paper to remember where you went and the locations of the traps.
      |||,
      jumpTo: 2
    },
    junctionSituation(['D', 'R'], 0), // Tile 2x2 (starting tile)
    junctionSituation(['D', 'R', 'L'], 1), // Tile 3x5; trap south
    junctionSituation(['D', 'R', 'U'], 2), // Tile 5x2
    { // Tile 5x3; Trap; index 5
      title: "Trap",
      description: TILES.traps[2],
      nextQuestion: -1
    },
    junctionSituation(['D', 'R', 'U'], 3), // Tile 6x2
    LOCKED_BOX.situations[0], // Tile 8x2; Locked box
    LOCKED_BOX.situations[1], // Box is locked
    LOCKED_BOX.situations[2], // Box is unlockable
    LOCKED_BOX.situations[3], // Box has already been unlocked; index 10
    LOCKED_BOX.situations[4], // Box unlocking
    junctionSituation(['R', 'U', 'L'], 7), // Tile 8x6; Trap north, key to the east
    { // Tile 7x6; Trap
      title: "Trap",
      description: TILES.traps[0],
      nextQuestion: -1
    },
    KEY.situations[0], // Key available
    KEY.situations[1], // Key picked up; index 15
    KEY.situations[2], // Key already in backpack
    junctionSituation(['R', 'U', 'L'], 9), // Tile 6x3; Trap north
    { // Tile 5x5; Trap
      title: "Trap",
      description: TILES.traps[1],
      nextQuestion: -1
    },
    junctionSituation(['R', 'U', 'L'], 10), // Tile 6x5; trap north
    SCROLL_DOOR.situations[0], // Door locked; index 20
    SCROLL_DOOR.situations[1], // Unlockable
    SCROLL_DOOR.situations[2], // Unlocking procedure
    SCROLL_DOOR.situations[3], // Unlocking procedure

    SCROLL_ROOM.situations[0], // Scroll room; scroll available
    SCROLL_ROOM.situations[1], // Scroll room; scroll available; index 25
    SCROLL_ROOM.situations[2], // Scroll room; scroll unavailable
    SCROLL_ROOM.situations[3], // Scroll contents
    SCROLL_ROOM.situations[4], // Scroll contents
    SCROLL_ROOM.situations[5], // Scroll contents
    SCROLL_ROOM.situations[6], // Scroll contents; index 30
    SCROLL_ROOM.situations[7], // End of scroll reading

    EXIT_DOOR.situations[0], // Locked Door; Not unlockable
    EXIT_DOOR.situations[1], // Locked Door; Not unlockable
    EXIT_DOOR.situations[2], // Locked Door; Not unlockable
    EXIT_DOOR.situations[3], // Locked Door; Unlockable; index 35
    EXIT_DOOR.situations[4], // Locked Door; Unlockable
    EXIT_DOOR.situations[5], // Locked Door; Unlockable
    EXIT_DOOR.situations[6], // Scroll reading
    EXIT_DOOR.situations[7], // Scroll reading
    EXIT_DOOR.situations[8], // Scroll reading; index 40
    EXIT_DOOR.situations[9], // Scroll reading
    EXIT_DOOR.situations[10], // Digit 1
    EXIT_DOOR.situations[11], // Digit 2
    EXIT_DOOR.situations[12], // Digit 3
    EXIT_DOOR.situations[13], // Digit 4; index 45
    EXIT_DOOR.situations[14], // Code did not work

    { // Final exit situation.
      title: "Exit?",
      description: |||
        There was a sudden screech. As if rusty mechanical parts are rubbing against each other. There were loud clanks and thuds.
        Yes, the door started sliding. It is slowly opening. There are tears in %s's eyes. He is thinking of good freedom.
        Freedom in every which way, good food, a roof, a life!
      ||| % CHARACTERS.main,
      jumpTo: 48
    },
    {
      title: "An Exit To...",
      description: |||
        The door was quite wide open now. But wait, there is no light coming through it.
        Is it night outside? Where even is %s?
        Wait, what? That can't be... Noooooooooooooooooooooooooooooooooooo!
      ||| % CHARACTERS.main,
      nextQuestion: -1
    },
  ],
  questions: [
    junctionQuestion([directionOpt('D', 4), directionOpt('R', 3)]), // Tile 2x2 (starting ti  le); south goes directly to 5x2
    junctionQuestion(
      [
        directionOpt('D', 18),
        directionOpt('R', 32, [
          {condition: {variables: {hasScroll: true}}, nextSituation: 35},
          {condition: {variables: {hasScroll: false}}, nextSituation: 32},
        ]),
        directionOpt('L', 2)
      ]
    ), // Tile 3x5; trap south; exit door to the east
    junctionQuestion([directionOpt('D', 6), directionOpt('R', 5), directionOpt('U', 2)]), // Tile 5x2; Trap to the east
    junctionQuestion(
      [
        directionOpt(
          'D', 7,
          [
            {condition: {variables: {hasMysteriousWeight: true}}, nextSituation: 10},
            {condition: {variables: {hasMysteriousWeight: false}}, nextSituation: 7},
          ]
        ), // Should go to unlocked or locked box, so conditional
        directionOpt('R', 17),
        directionOpt('U', 4)
      ]
    ), // Tile 6x2
    LOCKED_BOX.questions[0], // Tile 8x2; Locked Box
    LOCKED_BOX.questions[1], // Tile 8x2; Unlockable Box; index 5
    LOCKED_BOX.questions[2], // Tile 8x2; Already unlocked box
    junctionQuestion(
      [
        directionOpt(
          'R', 14,
          [
            {condition: {variables: {hasKey: false}}, nextSituation: 14},
            {condition: {variables: {hasKey: true}}, nextSituation: 16},
          ],
        ),
        directionOpt('U', 13),
        directionOpt(
          'L', 7,
          [
            {condition: {variables: {hasMysteriousWeight: true}}, nextSituation: 10},
            {condition: {variables: {hasMysteriousWeight: false}}, nextSituation: 7},
          ]
        ) // Should go to unlocked or locked box, so conditional
      ]
    ), // Tile 8x6
    KEY.questions[0],
    junctionQuestion([directionOpt('R', 19), directionOpt('U', 5), directionOpt('L', 6)]), // Tile 6x3; trap north
    junctionQuestion(  // Tile 6x5; trap above; index 10
      [
        directionOpt('R', 20, [
          {condition: {variables: {hasOpenedScrollDoor: true, hasScroll: true}}, nextSituation: 26},
          {condition: {variables: {hasOpenedScrollDoor: true, hasScroll: false}}, nextSituation: 24},
          {condition: {variables: {hasMysteriousWeight: true}}, nextSituation: 21},
          {condition: {variables: {hasMysteriousWeight: false}}, nextSituation: 20},
        ]),
        directionOpt('U', 18), directionOpt('L', 17)
      ]
    ),
    SCROLL_DOOR.questions[0],
    SCROLL_ROOM.questions[0],

    EXIT_DOOR.questions[0], // Options
    EXIT_DOOR.questions[1], // Digit 1
    EXIT_DOOR.questions[2], // Digit 2; index 15
    EXIT_DOOR.questions[3], // Digit 3
    EXIT_DOOR.questions[4], // Digit 4
  ]
}
