import consumer from "./consumer";


const initChatroomCable = () => {

  const messagesContainer = document.getElementById("messages");

  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({
      channel: "ChatroomChannel",
      id: id
    }, {
      received(data) {
        const currentUser = document.body.dataset.user
        // Create a DOM element placeholder
        const template = document.createElement('template');
        template.innerHTML = data.html
        // Message is firstchild of data.html
        const message = template.content.firstChild
        const author = message.dataset.author
        message.classList.add(currentUser === author ? 'left' : 'right');
        messagesContainer.insertAdjacentElement("beforeend", message);
      },
    });
  }

};

export { initChatroomCable };