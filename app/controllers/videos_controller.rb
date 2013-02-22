class VideosController < ApplicationController
  respond_to :html, :json
  expose :video

  def new
  end

  def create
    YoutubeToGif.new(video.id).delay.perform! if video.save
    respond_with(video)
  end

  def show
    respond_with(video)
  end
end
