import consumer from "./consumer"

consumer.subscriptions.create("PokerChannel", {
    connected() {
        console.log("I'm Connected!! Poker Channel")
        // Called when the subscription is ready for use on the server
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {

        console.log(data.content);
        // $('#msg').append('<div class="message">' + data.content +'</div>')
        // Called when there's incoming data on the websocket for this channel
    }
});
