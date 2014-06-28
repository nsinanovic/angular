class EmployersController < ApplicationController
  respond_to :json


  def new
    @employer = Employer.new
  end




  def index

    # Gather all post data
    employers = Employer.all

    # Respond to request with post data in json format
    respond_with(employers) do |format|
      format.json { render :json => employers.as_json }
    end

  end

  def create
    if !params[:new_employer].blank?
      # Create and save new post from data received from the client
      new_employer = Employer.new
      new_employer.email = params[:new_employer][:email]
      new_employer.password = params[:new_employer][:password]
      new_employer.name = params[:new_employer][:name]
      new_employer.location = params[:new_employer][:location]
      new_employer.website = params[:new_employer][:website]

      # Confirm post is valid and save or return HTTP error
      if new_employer.valid?
        new_employer.save!
      else
        render "public/422", :status => 422
        return
      end

      # Respond with newly created post in json format
      respond_with(new_employer) do |format|
        format.json { render :json => new_employer.as_json }
      end
    elsif !params[:edit_employer].blank?
      # Edit and save new post from data received from the client
      edit_employer = Employer.find_by_id(params[:edit_employer][:id])
      edit_employer.email = params[:edit_employer][:email]
      edit_employer.password = params[:edit_employer][:password]
      edit_employer.name = params[:edit_employer][:name]
      edit_employer.location = params[:edit_employer][:location]
      edit_employer.website = params[:edit_employer][:website]

      # Confirm post is valid and save or return HTTP error
      if edit_employer.valid?
        edit_employer.save!
      else
        render "public/422", :status => 422
        return
      end

      # Respond with edited post in json format
      respond_with(edit_employer) do |format|
        format.json { render :json => edit_employer.as_json }
      end
    else
      # if delete request
      delete_employer = Employer.find_by_id(params[:delete_employer][:id])
      # Confirm post is valid and save or return HTTP error
      if !delete_employer.blank?
        delete_employer.destroy!
      else
        render "public/422", :status => 422
        return
      end
      # Respond with edited post in json format
      respond_with(delete_employer) do |format|
        format.json { render :json => delete_employer.as_json }
      end

    end
  end

end
