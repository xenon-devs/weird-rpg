{
  locked_box: {
    locked: "The mysterious box is locked. Probably needs a rusty old key.",
    unlockable: "The mysterious box is locked. Perhaps the key in your inventory can be used to unlock it. Do you want to try to unlock the box?",
    unlocked: "There is box here but you already unlocked it.",
    contents: |||
      The rusty old key fit the keyhole. Yes, the box opened.
      Apart from years of dust and a few cobwebs, there is a mysterious looking, heavy object of a specific, rather peculiar shape and size inside.
      You picked up the mysterious weight and put it in your backpack.
    |||
  },
  key: {
    lying: "There is a rusty key here. Do you want to pick it up?",
    picked: "You picked up the rusty, old key. What could it possibly open? The door to heavens, the exit or something else?",
    already_picked: "You already have the key in your backpack. Keys do not regenerate. Also, two copies of the same key do not open different locks."
  },
  traps: [
    "You tried to walk, but the floor cracked and you fell into a pool of lava.",
    "You walked into a booby trap. You stepped onto a loose tile and poisonous arrows were fired from each direction.",
    "A large boulder fell on you and you were squished like a lemon."
  ],
  scroll_room: {
    available: [
      |||
        Apart from the horrible smell, the room has a box with what looks like cylindrical measuring weights.
        It has exactly 4 sets of 9 weights. Each weight has a number carved on it. 1, 2, 3....9
      |||,
      |||
        A mysterious scroll is carefully hidden behind a small hole in the wall. What could the scroll have on it?
        Why the weights? What kind of a mystery is this? Do you want to pick up these things?
      |||
    ]
  },
  scroll_door: {
    locked: |||
      There is a locked door here. You tried to push or break it but that did not work.
      There is a partially hidden with cobwebs, pecuiarly shaped hole next to it.
      What could it be for? What could go in there? Can it be used to open the door?
    |||,
    unlockable: |||
      There is a locked door here. There is also a peculiarly shaped hole next to it.
      Maybe the weird weight you found in the locked box can fit in the hole. Would you like to try that?
    |||,
    unlocked: [
      |||
        You put the weirdly shaped weight inside the hole. It fit perfectly. Suddenly there were cranks and thuds.
        It seems as if the weight moved some sort of an ancient lever or some other kind of machinery.
      |||,
      |||
        After a few seconds of weird noises, there was a sharp click.
        Perhaps the door opened. Yes, yes it definitely opened. It opened into a small, dark room with no lamps.
      |||
    ],
    scroll_contents: [

    ],
  },
  exit_door: [
    |||
      There is a large door here. So heavy that it can't be moved even by a milimeter. There is no key hole :eyes:.
      No visible lever either. Although there are 4 holes next to it. Each hole has what looks like a movable platform.
    |||,
    |||
      The platforms sag down if they are pushed. They also have a groove for a cylindrical object. Could be weights.
      Yes, weights would be able to push down the platforms. What if each one has to be pushed by a defined amount?
      Would that be the way to open the door? How would you push the platforms and by how much?
    |||
  ],
}
