class TinymceAssetsController < ApplicationController
  def create
    uploader = TinymceUploader.new

    uploader.store!(params[:file])

    render json: {
        image: {
            url: "#{root_url}#{uploader.url}"
        }
    }, content_type: "text/html"
  end
end
