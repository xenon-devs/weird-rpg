const { MessageEmbed } = require('discord.js');
const DiscordClient = require('./util/DiscordClient');
const { version } = require('../package.json');
require('dotenv').config();

const { prefix } = require('./config.json');
const { Story } = require('./story/story');

const helpEmbed = new MessageEmbed()
	.setColor('#0099ff')
	.setTitle('Weird RPG')
	.setURL('https://github.com/xenon-devs/weird-rpg')
	.setDescription('Time to dive back in Text mode and enjoy the weirdest ever RPG game')
	.setThumbnail('https://imgur.com/dQd2ziB.png')
	.addFields(
    { name: `${prefix}start`, value: 'Starts the game'},
    { name: `${prefix}help`, value:'Shows this message'},
    { name: 'Support Server', value: '[Click to Join](https://discord.gg/4NZqsUs)', inline: true },
    { name: 'Vote and Invite', value: '[Click Here](https://top.gg/bot/725722531918774284)', inline: true },
    { name: 'It\'s Open Source!', value: '[GitHub Link](https://github.com/xenon-devs/weird-rpg)', inline: true },
		{ name: 'Want to Write a Story?', value: '[Click Here](https://github.com/xenon-devs/weird-rpg/wiki/Getting-Started)', inline: true },
  )
  .setFooter(`v${version} | By Team Xenon`, 'https://raw.githubusercontent.com/xenon-devs/xen-assets/main/xen-inc/logo/xen-logo-black-bg.png');


const client = new DiscordClient();

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}`);
	client.user.setActivity(`New Story! | ${prefix}help`, { type: 'LISTENING' })
})

client.on('message', msg => {
  if (msg.content.trim().toLowerCase() == `${prefix}start`) {
    new Story(client, msg.channel, msg.author);
  }
  else if (msg.content.trim().toLowerCase() == `${prefix}help`) {
    msg.channel.send(helpEmbed);
  }
})


client.login(process.env.token);
