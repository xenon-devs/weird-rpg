const DiscordClient = require('./util/DiscordClient');
require('dotenv').config();

const { prefix } = require('../config.json');

const client = new DiscordClient();

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}`);
})

client.on('message', msg => {
  if (msg.content.trim().toLowercase() == `${prefix}start`) {
    msg.channel.send(`The game isn't ready lol`);
  }
})

client.login(process.env.token);