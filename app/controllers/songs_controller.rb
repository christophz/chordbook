class SongsController < ApplicationController
    before_action :authenticate_transcriber!, except: [:index, :show]
    def index
        @songs = Song.all
    end

    def new
        @song = current_transcriber.songs.build
    end

    def create
        @song = current_transcriber.songs.build(song_params)

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

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @transcriptions = @song.transcriptions

        if @song.update_attributes(song_params)
            render 'show'
        else
            render 'edit'
        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to root_path
    end

    private
        def song_params
            params.require(:song).permit(:title, :musician, :originalkey)
        end
end
