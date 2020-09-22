import consumer from "../channels/consumer";
import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = ["messages"]

  connect() {
    this.initChatroomCable()
  }

  initChatroomCable() {
    const messagesContainer = this.messagesTarget;
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
          message.classList.add(currentUser === author ? 'right' : 'left');
          messagesContainer.insertAdjacentElement("beforeend", message);
          document.getElementById('message_content').value = '';
        },
      });
    }
  }
}
