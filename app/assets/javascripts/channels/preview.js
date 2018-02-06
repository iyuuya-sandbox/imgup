App.preview = App.cable.subscriptions.create('PreviewChannel', {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(image) {
    $('#preview').html($('<img>', { src: image.image }))
  },

  show (image) {
    this.perform('show', { image })
  }
})
