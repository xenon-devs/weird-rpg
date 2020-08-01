const ask = require('../util/ask');
const { MessageEmbed } = require('discord.js');

const storyList = require('./storyList');

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
  const storyListEmbed = new MessageEmbed() // Embed to display the list of stories 
  .setTitle(`List of Stories`)

  const stories = storyList(player);
  stories.forEach(story => storyListEmbed.addField(story.name, story.description))

  channel.send(storyListEmbed);

  ask(client, player, channel, `Which story do you want to play?`, ans => {
    const storyName = ans.trim();

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
  channel.send(`Starting story **${story.name}**.`);
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

  if (situation.jumpTo) { // Optional jump to any situation through a continue prompt
    return ask(
      client,
      player,
      channel,
      `Type anything to continue.`,
      () => startSituation(client, channel, player, story, situation.jumpTo)
    )
  } 

  if (situation.nextQuestion === -1) return channel.send(`**THE END**`);
  else return askQuestion(client, channel, player, story, situation.nextQuestion);
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
  const question = story.questions[questionNo];
  let optionsString = `__${question.question}__\n`;

  question.options.forEach((ques, i) => {
    optionsString += `${i+1}) ${ques.opt}\n`;
  })

  const answerHandler = ans => {
    let ansNo = Number(ans.trim().toLowerCase());

    if (!isNaN(ansNo)) {
      ansNo = Math.floor(Math.abs(ansNo));
      if (ansNo <= question.options.length && ansNo > 0) {
        const nextSituationNo = question.options[ansNo - 1].nextSituation;
        startSituation(client, channel, player, story, nextSituationNo);
      }
      else return ask(client, player, channel, `Choices in life are few, and the option you selected doesn't exist. Choose again, wisely.`, answerHandler);
    }
    else return ask(client, player, channel, `I said number, fool! Okay, another chance for you.`, answerHandler);
  }

  ask(
    client,
    player,
    channel,
    `${optionsString}(type the option number)`,
    answerHandler
  )
}

module.exports = {
  selectStory,
  startStory
}
