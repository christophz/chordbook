class TranscriberController < ApplicationController

  def show
      @transcriber = Transcriber.find(params[:id])
  end

  def edit
      @transcriber = Transcriber.find(params[:id])
  end

  def update
      @transcriber = Transcriber.find(params[:id])

      if @transcriber.update_attributes(transcriber_params)
          render 'show'
      else
          render 'edit'
      end
  end

  private
      def transcriber_params
          params.require(:transcriber).permit(:name, :email, :instruments, :facebook_link, :twitter_link, :bandcamp_link, :soundcloud_link)
      end

end
