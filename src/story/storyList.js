const storyGenerators = [
  require('./stories/chatur')
]

/**
 * 
 * @param {User} player Player object for dynamic data.
 */
module.exports = function storyList(player) {
  return storyGenerators.map(storyGenerator => storyGenerator(player));
}