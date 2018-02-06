class ImageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(image)
    ActionCable.server.broadcast 'preview_channel', ImageSerializer.new([image]).serializable_hash
  end
end
