class PreviewChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'preview_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def show(data)
    ActionCable.server.broadcast 'preview_channel', image: data['image']
  end
end
