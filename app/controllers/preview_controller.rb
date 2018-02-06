class PreviewController < ApplicationController
  def master
    @image = Image.last
  end
end
