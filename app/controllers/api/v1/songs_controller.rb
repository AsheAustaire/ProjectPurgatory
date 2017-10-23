class Api::V1::SongsController < ApplicationController

  def index
    @songs = Song.all()
    render({json: @songs})
  end

  # def update
  #   @song = Song.find(params[:id])
  #   @song.update(song_params)
  #   if @note.save
  #     render({json: @song})
  #   else
  #     render({json: {errors: @note.errors.full_messages}, status: 422})
  # end
  #
  # private
  #
  #   def song_params
  #     params.permit(:title, :content)
  #   end
  # end
end
