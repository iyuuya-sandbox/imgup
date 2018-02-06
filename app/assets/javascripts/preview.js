class Preview {
  index(image) {
    console.log(image.image)
    $('#preview').html($('<img>', { src: image.image }))
  }
}
