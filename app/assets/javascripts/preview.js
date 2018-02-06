class Preview {
  constructor(data) {
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
}
