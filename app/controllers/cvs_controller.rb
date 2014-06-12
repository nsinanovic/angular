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


    # Confirm post is valid and save or return HTTP error
    if !params[:new_cv].blank?
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
        render "public/422", :status => 422
        return
      end

      # Respond with newly created post in json format
      respond_with(new_cv) do |format|
        format.json { render :json => new_cv.as_json }
      end
    elsif !params[:edit_cv].blank?
      # Edit and save new post from data received from the client
      edit_cv = Cv.find_by_id(params[:edit_cv][:id])
      edit_cv.dodatno = params[:edit_cv][:dodatno] # Get only first 250 characters
      edit_cv.naslov = params[:edit_cv][:naslov]
      edit_cv.radnoIskustvo = params[:edit_cv][:radnoIskustvo]
      edit_cv.strucnaSprema = params[:edit_cv][:strucnaSprema]
      edit_cv.obrazovanje = params[:edit_cv][:obrazovanje]
      edit_cv.jezici = params[:edit_cv][:jezici]
      edit_cv.vjestine = params[:edit_cv][:vjestine]
      edit_cv.ostaleInformacije = params[:edit_cv][:ostaleInformacije]

      # Confirm post is valid and save or return HTTP error
      if edit_cv.valid?
        edit_cv.save!
      else
        render "public/422", :status => 422
        return
      end

      # Respond with edited post in json format
      respond_with(edit_cv) do |format|
        format.json { render :json => edit_cv.as_json }
      end
    else
      # if delete request
      delete_cv = User.find_by_id(params[:delete_cv][:id])
      # Confirm post is valid and save or return HTTP error
      if !delete_cv.blank?
        delete_cv.destroy!
      else
        render "public/422", :status => 422
        return
      end
      # Respond with edited post in json format
      respond_with(delete_cv) do |format|
        format.json { render :json => delete_cv.as_json }
      end
    end
    
  end
  def edit
    # Edit and save new post from data received from the client
    edit_cv = Cv.find_by_id(params[:edit_cv][:id])
    edit_cv.dodatno = params[:edit_cv][:dodatno] # Get only first 250 characters
    edit_cv.naslov = params[:edit_cv][:naslov]
    edit_cv.radnoIskustvo = params[:edit_cv][:radnoIskustvo]
    edit_cv.strucnaSprema = params[:edit_cv][:strucnaSprema]
    edit_cv.obrazovanje = params[:edit_cv][:obrazovanje]
    edit_cv.jezici = params[:edit_cv][:jezici]
    edit_cv.vjestine = params[:edit_cv][:vjestine]
    edit_cv.ostaleInformacije = params[:edit_cv][:ostaleInformacije]

    # Confirm post is valid and save or return HTTP error
    if edit_cv.valid?
      edit_cv.save!
    else
      render "public/422", :status => 422
      return
    end

    # Respond with edited post in json format
    respond_with(edit_cv) do |format|
      format.json { render :json => edit_cv.as_json }
    end
  end


end

    # Create and save new post from data received from the client




