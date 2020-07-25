const DiscordClient = require('./util/DiscordClient');
require('dotenv').config();

const { prefix } = require('./config.json');
const { selectStory } = require('./stories/story');

const client = new DiscordClient();

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}`);
})

client.on('message', msg => {
  if (msg.content.trim().toLowerCase() == `${prefix}start`) {
    selectStory(client, msg.channel, msg.author);
  }
})

client.login(process.env.token);