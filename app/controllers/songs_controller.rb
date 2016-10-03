class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)

        if @song.save
            redirect_to @song
        else
            render 'new'
        end
    end

    def show
        @song = Song.find(params[:id])
        @transcriptions = @song.transcriptions
    end

    private
        def song_params
            params.require(:song).permit(:title, :musician, :originalkey)
        end
end
