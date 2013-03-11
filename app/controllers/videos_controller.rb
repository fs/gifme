class VideosController < ApplicationController
  respond_to :html, :json

  expose(:video, attributes: :video_params)

  def new
  end

  def create
    YoutubeToGif.new(video.id).delay.perform! if video.save
    respond_with(video)
  end

  def show
    respond_with(video)
  end

  private

  def video_params
    params.require(:video).permit(:url, :start, :duration)
  end
end
