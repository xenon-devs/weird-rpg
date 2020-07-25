const { Client } = require('discord.js');
require('dotenv').config();

const client = new Client();

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}`);
})

client.login(process.env.token);