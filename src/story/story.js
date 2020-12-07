const ask = require('../util/ask');
const { MessageEmbed, TextChannel, User } = require('discord.js');
const { DiscordClient } = require('../util/DiscordClient');
const storyList = require('./storyList');

class Story {
  static storyList = storyList;
  /** @type {DiscordClient} */
  client;
  /** @type {TextChannel} */
  channel;
  /** @type {User} */
  player;
  /** @type {number} */
  currentSituationNumber;
  /** @type {number} */
  currentQuestionNumber;
  story;
  storyVariables = {};

  constructor(
    client,
    channel,
    player
  ) {
    this.client = client;
    this.channel = channel;
    this.player = player;

    this.selectStory();
  }

  selectStory() {
    const storyListEmbed = new MessageEmbed() // Embed to display the list of stories
      .setTitle(`List of Stories`)

    const stories = Story.storyList(this.player);
    stories.forEach((story, i) => storyListEmbed.addField(`${i+1}) ${story.name} by **${story.author}**`, story.description));

    this.channel.send(storyListEmbed);

    ask(
      this.client,
      this.player,
      this.channel,
      `Which story do you want to play? (type the number)`,
      ans => {
        const storyId = Number(ans.trim().toLowerCase()) - 1;

        if (stories[storyId]) {
          this.story = stories[storyId];
          return this.startStory();
        }

        return this.channel.send(`Story does not exist.`);
      }
    )
  }

  startStory() {
    this.channel.send(`Starting story **${this.story.name}**.`);
    this.channel.send(this.story.description);

    if ('variables' in this.story) {
      for (let variable in this.story.variables) {
        this.storyVariables[variable] = this.story.variables[variable];
      }
    }

    this.startSituation(0);
  }

  /**
   *
   * @param {number} situtationNumber
   */
  startSituation(
    situtationNumber
  ) {
    const situation = this.story.situations[situtationNumber];
    this.currentSituationNumber = situtationNumber;

    this.channel.send(`**${situation.title}** \n${situation.description}`);

    if (situation.setVariables) {
      for (let variable in situation.setVariables) {
        if (this.storyVariables[variable]) this.storyVariables[variable] = situation.setVariables[variable];
      }
    }

    if (situation.jumpTo) { // Optional jump to any situation through a continue prompt
      return ask(
        this.client,
        this.player,
        this.channel,
        `Type anything to continue.`,
        () => this.startSituation(situation.jumpTo)
      )
    }

    if (situation.nextQuestion === -1) return this.channel.send(`**THE END**`);
    else return this.askQuestion(situation.nextQuestion);
  }

  /**
   *
   * @param {number} questionNo
   */
  askQuestion(
    questionNo
  ) {
    const question = this.story.questions[questionNo];
    this.currentQuestionNumber = questionNo;

    let optionsString = `__${question.question}__\n`;

    question.options.forEach((ques, i) => {
      optionsString += `${i+1}) ${ques.opt}\n`;
    })

    const answerHandler = (ans) => {
      let ansNo = Number(ans.trim().toLowerCase());

      if (!isNaN(ansNo)) {
        ansNo = Math.floor(Math.abs(ansNo));
        if (ansNo <= question.options.length && ansNo > 0) {
          const selectedOption = question.options[ansNo - 1];

          if (selectedOption.setVariables) {
            for (let variable in selectedOption.setVariables) {
              if (this.storyVariables[variable]) this.storyVariables[variable] = selectedOption.setVariables[variable];
            }
          }

          if (selectedOption.conditionalNext) {
            for (let conditional of selectedOption.conditionalNext) {
              let isConditionMet = true;

              for (let variableCondition in conditional.condition.variables) {
                if (this.storyVariables[variableCondition] !== conditional.condition.variables[variableCondition]) isConditionMet = false;
              }

              if (isConditionMet) return this.startSituation(conditional.nextSituation);
            }
          }

          return this.startSituation(selectedOption.nextSituation);
        }
        else return ask(this.client, this.player, this.channel, `Choices in life are few, and the option you selected doesn't exist. Choose again, wisely.`, answerHandler);
      }
      else return ask(this.client, this.player, this.channel, `I said number, fool! Okay, another chance for you.`, answerHandler);
    }

    ask(
      this.client,
      this.player,
      this.channel,
      `${optionsString}(type the option number)`,
      answerHandler
    )
  }
}

module.exports = {
  Story
}
