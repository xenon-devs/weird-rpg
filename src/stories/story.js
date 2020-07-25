const ask = require('..util/ask');
const { MessageEmbed } = require('discord.js');

// NOTE: -1 in a story is the end of the story
const mrchatur = require('./chatur.json');

const stories = [
  mrchatur
]

const storyListEmbed = new MessageEmbed()
  .setTitle(`List of stories`)

stories.forEach(story => storyListEmbed.addField(story.name, story.description))

/**
 * 
 * @param {DiscordClient} client
 * @param {Channel} channel
 * @param {User} player 
 */
function selectStory(
  client,
  channel,
  player
) {
  channel.send(storyListEmbed);

  ask(client, player, channel, `Which story do you want to play?`, ans => {
    const storyName = ans.trim().toLowerCase();

    for (let story of stories) if (story.name === storyName) {
      return startStory(client, channel, player, story);
    }

    return channel.send(`Story does not exist.`);
  })
}

/**
 * 
 * @param {DiscordClient} client 
 * @param {Channel} channel 
 * @param {Usr} player 
 * @param {Story} story 
 */
function startStory(
  client,
  channel,
  player,
  story
) {
  channel.send(`Starting story ${story.name}.`);
  channel.send(story.description);
}
