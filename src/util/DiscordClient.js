const { Client } = require('discord.js');

class DiscordClient extends Client {
  onMessageList;

  constructor(clientOptions) {
    super(clientOptions);
    this.onMessageList = [];

    this.on('message', msg  => {
      return this.onMessageList.forEach(onMsgHandler => {
        onMsgHandler.handler(msg);
      })
    })
  }

  /**
   * @description Optimized on message event listener. Uses a single event listener to check for all events.
   * @param msgHandler An object with an even handler on the message event.
   */
  onMsg(msgHandler) {
    this.onMessageList.push(msgHandler);
  }

  offMsg(handlerName) {
    this.onMessageList = this.onMessageList.filter(handler => handler.name != handlerName);
  }
}

module.exports = DiscordClient;