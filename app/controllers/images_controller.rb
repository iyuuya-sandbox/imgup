class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.create! params.required(:image).permit(:image)
    redirect_to root_path
  end
end
