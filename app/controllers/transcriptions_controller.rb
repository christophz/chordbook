class TranscriptionsController < ApplicationController
    before_action :authenticate_transcriber!, except: [:show]

    def new
        @transcription = current_transcriber.transcriptions.build
    end

    def create
        @transcription = current_transcriber.transcriptions.build(transcription_params)

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

        if @transcription.update_attributes(transcription_params)
            render 'show'
        else
            render 'edit'
        end
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
