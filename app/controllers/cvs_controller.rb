class CvsController < ApplicationController
  respond_to :json

  def index

    # Gather all post data
    cvs = Cv.all

    # Respond to request with post data in json format
    respond_with(cvs) do |format|
      format.json { render :json => cvs.as_json }
    end

  end

  def create

    # Create and save new post from data received from the client
    new_post = Cv.new
    new_post.naslov = params[:new_post][:naslov]
    new_post.dodatno = params[:new_post][:dodatno]

    # Confirm post is valid and save or return HTTP error
    if new_post.valid?
      new_post.save!
    else
      render "public/422", :status => 422
      return
    end

    # Respond with newly created post in json format
    respond_with(new_post) do |format|
      format.json { render :json => new_post.as_json }
    end

  end
end
