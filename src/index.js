const { MessageEmbed } = require('discord.js');
const DiscordClient = require('./util/DiscordClient');
const { version } = require('../package.json');
require('dotenv').config();

const { prefix } = require('./config.json');
const { selectStory } = require('./story/story');

const helpEmbed = new MessageEmbed()
	.setColor('#0099ff')
	.setTitle('Weird RPG')
	.setURL('https://github.com/xenon-devs/weird-rpg')
	.setDescription('Time to dive back in Text mode and enjoy the weirdest ever RPG game')
	.setThumbnail('https://imgur.com/dQd2ziB.png')
	.addFields(
    { name: '*start', value: 'Starts the game'},
    { name: '*help', value:'Shows this message'},
    { name: 'Support Server', value: '[Discord](https://discord.gg/4NZqsUs)', inline: true },
    { name: 'Vote and Invite', value: '[Top.gg](https://top.gg/bot/725722531918774284)', inline: true },
    { name: 'GitHub', value: '[/Weird-Life](https://github.com/xenon-devs/weird-rpg)', inline: true },
		{ name: 'Submit Story', value: '[Walkthrough](https://github.com/xenon-devs/weird-rpg/wiki/Getting-Started)', inline: true },
  )
  .setFooter(`v${version} | By Team Xen`, 'https://imgur.com/gKWB0Xf.png');


const client = new DiscordClient();

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}`);
	client.user.setActivity(`${prefix}help weirdly`, { type: 'PLAYING' })
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
