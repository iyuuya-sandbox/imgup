class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    Image.create! params.required(:image).permit(:image)
    @image = Image.new
    redirect_to root_path
  rescue => e
    logger.debug e.message
    logger.debug e.backtrace.join("\n")
    redirect_to root_path
  end
end
