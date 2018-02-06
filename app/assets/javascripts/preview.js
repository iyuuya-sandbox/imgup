class Preview {
  master(image) {
    $('#preview-master').html($('<img>', { src: image.image }))
  }
}
