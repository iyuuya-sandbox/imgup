class PreviewController < ApplicationController
  def index
    @image = Image.last
  end
end
