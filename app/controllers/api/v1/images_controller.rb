class Api::V1::ImagesController < ApplicationController
  def index
    @images = Image.all
    render json: ImageSerializer.new(@images).serialized_json
  end
end
