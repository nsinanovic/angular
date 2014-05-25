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
    new_cv.dodatno = params[:new_cv][:dodatno] # Get only first 250 characters
    new_cv.naslov = params[:new_cv][:naslov]
    new_cv.radnoIskustvo = params[:new_cv][:radnoIskustvo]
    new_cv.strucnaSprema = params[:new_cv][:strucnaSprema]
    new_cv.obrazovanje = params[:new_cv][:obrazovanje]
    new_cv.jezici = params[:new_cv][:jezici]
    new_cv.vjestine = params[:new_cv][:vjestine]
    new_cv.ostaleInformacije = params[:new_cv][:ostaleInformacije]

    # Confirm post is valid and save or return HTTP error
    if new_cv.valid?
      new_cv.save!
    else

      return
    end

    # Respond with newly created post in json format
    respond_with(new_cv) do |format|
      format.json { render :json => new_cv.as_json }
    end
    
  end
end

    # Create and save new post from data received from the client




