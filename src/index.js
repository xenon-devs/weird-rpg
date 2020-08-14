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
    { name: '*start to start the game'},
    { name: '*help to to show this message'},
		
	)
	.setTimestamp()
	.setFooter('[support server](https://discord.gg/4NZqsUs)', '[github wiki](https://github.com/Eniamza/Weird-Life/wiki)');

  
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
