App.preview = App.cable.subscriptions.create('PreviewChannel', {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(image) {
    const preview = new Preview()
    preview.index(image)
  },

  show (image) {
    this.perform('show', { image })
  }
})
