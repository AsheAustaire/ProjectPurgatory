class Api::V1::SongsController < ApplicationController

  def index
    @songs = Song.all()
    render({json: @songs})
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    if @song.save
      render({json: @song})
    else
      render({json: {errors: @song.errors.full_messages}, status: 422})
    end
  end

  def search_post
    spotAuth()
    @year = params[:year]
    @genre = params[:genre]
    @results = RSpotify::Base.search(@genre, 'artist')
    render json: {'results': @results}
  end

  private

    def spotAuth()
      RSpotify.authenticate("c6154599319545bf87d2d4afbc1380b9", "8707d05dacab4083bd2186609a72a533")
    end

    def song_params()
      params.require(:search).permit(:year, :genre)
    end
end
