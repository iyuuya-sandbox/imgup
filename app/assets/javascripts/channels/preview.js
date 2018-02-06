App.preview = App.cable.subscriptions.create('PreviewChannel', {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log('preview_channel: received')
    const preview = new Preview(data.data)
    preview.master()
  },

  // show (datum) {
  //   this.perform('show', { datum })
  // }
})
