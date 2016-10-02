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

    def show
        @transcription = Transcription.find(params[:id])
    end

    private
        def transcription_params
            params.require(:transcription).permit(:key, :level, :lyrics, :video, :comment)
        end
end