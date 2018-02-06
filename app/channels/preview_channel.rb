class PreviewChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'preview_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def show(data)
    logger.debug data
    # ActionCable.server.broadcast 'preview_channel', image: data['image']
    ActionCable.server.broadcast 'preview_channel', data
  end
end
