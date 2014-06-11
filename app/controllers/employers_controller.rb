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

  end

end
