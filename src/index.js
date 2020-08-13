const DiscordClient = require('./util/DiscordClient');
require('dotenv').config();

const { prefix } = require('./config.json');
const { selectStory } = require('./story/story');

const client = new DiscordClient();

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}`);
})

client.on('message', msg => {
  if (msg.content.trim().toLowerCase() == `${prefix}start`) {
    selectStory(client, msg.channel, msg.author);
  }
  else if (msg.content.trim().toLowerCase() == `${prefix}help`) {
    msg.channel.send(`Woah.. We thought it's easy as hell.Yet...
    *start to start the game
    *help to show this message
    For Bot support, bug report and Story submission Join https://discord.gg/4NZqsUs`); 
  }
})
  

client.login(process.env.token);
