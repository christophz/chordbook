class TranscriptionsController < ApplicationController
    def index
        @transcriptions = Transcription.all
    end

    def new
        @transcription = Transcription.new
    end

    def create
        @transcription = Transcription.new(transcription_params)

        if @transcription.save
            redirect_to @transcription
        else
            render 'new'
        end
    end

    def edit
        @transcription = Transcription.find(params[:id])
    end

    def show
        @transcription = Transcription.find(params[:id])
    end

    def update
        @transcription = Transcription.find(params[:id])

        # @transcription.key = "G"
        # @transcription.save
        if @transcription.update_attributes(transcription_params)
            render 'show'
        else
            render 'edit'
        end
        #     redirect_to root_url
        # else
        #     @transcriptions = Transcription.all
        #     render :action => 'edit'
        # end
    end

    def destroy
        @transcription = Transcription.find(params[:id])
        @transcription.destroy
        redirect_to @transcription.song
    end

    private
        def transcription_params
            params.require(:transcription).permit(:key, :level, :lyrics, :video, :comment, :song_id)
        end
end
