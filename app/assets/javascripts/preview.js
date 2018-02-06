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
    const duration = 5 * 1000 // per 10 sec
    const count = this.data.length
    console.log(count)
    for (let i = 0; i < count; i++) {
      setTimeout(() => {
        const datum = this.data[i]
        $('#preview-test1').html($('<img>', { src: datum.attributes.image_url }))
      }, duration * i)
    }
  }
}
