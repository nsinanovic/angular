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
    new_cv = Cv.new
    new_cv.dodatno= params[:new_cv][:dodatno][0...250] # Get only first 250 characters
    new_cv.naslov = params[:new_cv][:naslov]

    # Confirm post is valid and save or return HTTP error
    if new_cv.valid?
      new_cv.save!
    else
      render "public/422", :status => 422
      return
    end

    # Respond with newly created post in json format
    respond_with(new_cv) do |format|
      format.json { render :json => new_cv.as_json }
    end

  end

end
