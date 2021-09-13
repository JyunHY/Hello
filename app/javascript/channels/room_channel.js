import consumer from "./consumer"
document.addEventListener('turbolinks:load', () => {

  const room_element = document.getElementById('room-id');

  console.log(consumer.subscriptions)
  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })
  
  if (room_element){
    const room_id = room_element.getAttribute('data-room-id');
    // console.log(room_id)
    // console.log(consumer.subscriptions)
    consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id }, {
      connected() {
        // Called when the subscription is ready for use on the server
        console.log("connected to " + room_id)
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
        // console.log('See you !')
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        console.log(data)
        
        const user_element = document.getElementById('user-id');
        const user_id = Number(user_element.getAttribute('data-user-id'));
  
        let html;
  
        if (user_id === data.user) {
          html = data.mine
        } else {
          html = data.theirs
        }
  

        const messageBody = document.getElementById('messageBody')
        messageBody.innerHTML = messageBody.innerHTML + html
        // document.querySelector('form.message_form').reset()
      }
    });

  }

})