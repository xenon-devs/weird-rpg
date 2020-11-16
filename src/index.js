const { MessageEmbed } = require('discord.js');
const DiscordClient = require('./util/DiscordClient');
require('dotenv').config();

const { prefix } = require('./config.json');
const { selectStory } = require('./story/story');

const helpEmbed = new MessageEmbed()
	.setColor('#0099ff')
	.setTitle('Weird Life')
	.setURL('https://github.com/Eniamza/Weird-Life')
	.setDescription('Weird life is a recreation of Zork [A CMD based story game] ')
	.setThumbnail('https://imgur.com/QCYWXqd.png')
	.addFields(
    { name: '*start', value: 'Starts the game'},
    { name: '*help', value:'Shows this message'},
    { name: 'Support Server', value: '[Discord](https://discord.gg/4NZqsUs)', inline: true },
    { name: 'Vote and Invite', value: '[Top.gg](https://top.gg/bot/725722531918774284)', inline: true },
    { name: 'GitHub', value: '[/Weird-Life](https://github.com/Eniamza/Weird-Life/)', inline: true },
		{ name: 'Submit Story', value: '[Walkthrouh](https://github.com/Eniamza/Weird-Life/wiki/Getting-Started)', inline: true },
  )

  .setFooter('By Team Weirdo', 'https://imgur.com/n6KfcIa.png');


const client = new DiscordClient();

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}`);
})

client.on('message', msg => {
  if (msg.content.trim().toLowerCase() == `${prefix}start`) {
    selectStory(client, msg.channel, msg.author);
  }
  else if (msg.content.trim().toLowerCase() == `${prefix}help`) {
    msg.channel.send(helpEmbed);
  }
})


client.login(process.env.token);
