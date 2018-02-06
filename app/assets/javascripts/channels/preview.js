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
    preview.test1()
    preview.test2()
  },

  // show (datum) {
  //   this.perform('show', { datum })
  // }
})

$(() => {
  $.get('/api/v1/images.json', (data) => {
    const preview = new Preview(data.data)
    preview.master()
    // preview.test1()
    preview.test2()
  })
})
