const ask = require('../util/ask');
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

  startSituation(client, channel, player, story, 0);
}

/**
 * 
 * @param {DiscordClient} client
 * @param {Channel} channel 
 * @param {User} player 
 * @param {Story} story 
 * @param {number} situtationNo 
 */
function startSituation(
  client,
  channel,
  player,
  story,
  situtationNo
) {
  const situation = story.situations[situtationNo];
  channel.send(`\
**${situation.title}**
${situation.description}\
`)

  if (situation.nextQuestion === -1) channel.send(`**THE END**\n Life is short, isn't it?`);
  else askQuestion(client, channel, player, story, situation.nextQuestion);
}

/**
 * 
 * @param {DiscordClient} client
 * @param {Channel} channel 
 * @param {User} player 
 * @param {Story} story 
 * @param {number} questionNo 
 */
function askQuestion(
  client,
  channel,
  player,
  story,
  questionNo
) {
  let optionsString = '';
  const question = story.questions[questionNo];

  question.options.forEach((ques, i) => {
    optionsString += `${i+1}) ${ques.opt}`;
  })
  
  channel.send(optionsString);

  const answerHandler = ans => {
    const ansNo = Number(ans.trim().toLowerCase());

    if (!isNaN(ansNo)) {
      if (question.options.length <= ansNo) {
        const nextSituationNo = question.options[ansNo - 1].nextSituation;
        startSituation(client, channel, player, story, nextSituationNo);
      }
      else return ask(client, player, channel, `Choices in life are few, and the option you selected doesn't exist.`, answerHandler);
    }
    else return ask(client, player, channel, `I said number, fool!`, answerHandler);
  }

  ask(
    client,
    player,
    channel,
    `What do you want to do? (type option number)`,
    answerHandler
  )
}

module.exports = {
  stories,
  selectStory,
  startStory
}