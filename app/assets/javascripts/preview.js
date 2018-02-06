class Preview {
  constructor(data) {
    this.data = data
  }

  master() {
    for (const datum of Array.from(this.data)) {
      $('#preview-master').html($('<img>', { src: datum.attributes.image_url }))
    }
  }
}

$(() => {
  $.get('/api/v1/images.json', (data) => {
    const preview = new Preview(data.data)
    preview.master()
  })
})
