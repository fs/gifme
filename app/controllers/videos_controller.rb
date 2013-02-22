class VideosController < ApplicationController
  expose(:video)

  def new
  end

  def create
    if video.save
      YoutubeToGif.new(video.id).delay.perform!
      redirect_to(video, notice: 'We are generating Gif for you right now!')
    else
      render 'new'
    end
  end

  def show
  end
end
