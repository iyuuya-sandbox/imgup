class ImageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(image)
    ActionCable.server.broadcast 'preview_channel', image: image.image.url
  end
end
