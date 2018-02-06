class Preview {
  constructor(data) {
    console.log(data)
    this.data = data
  }

  master() {
    for (const datum of Array.from(this.data)) {
      $('#preview-master').html($('<img>', { src: datum.attributes.image_url }))
    }
  }

  test1() {
    for (const datum of Array.from(this.data)) {
      App.job_queue.add_job(() => {
        $('#preview-test1').html($('<img>', { src: datum.attributes.image_url }))
      })
    }
  }

  test2() {
    console.log('test2')
    for (const datum of Array.from(this.data)) {
      const z_index = App.job_queue.length() * -1
      const queue_img = $('<img>', { src: datum.attributes.image_url, width: 128, 'data-id': datum.id }).css({ 'z-index': z_index })
      $('#preview-test2 .queues').append(queue_img)
      App.job_queue.add_job(() => {
        $('#preview-test2 .current').html($('<img>', { src: datum.attributes.image_url }))
        queue_img.remove()
      })
    }
  }
}
