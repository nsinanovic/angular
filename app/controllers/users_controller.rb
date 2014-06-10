class UsersController < ApplicationController
  respond_to :json


  def new
    @user = User.new
  end




  def index

    # Gather all post data
    users = User.all

    # Respond to request with post data in json format
    respond_with(users) do |format|
      format.json { render :json => users.as_json }
    end

  end

  def create

    # Create and save new post from data received from the client
    new_user = User.new
    new_user.email = params[:new_user][:email][0...250] # Get only first 250 characters
    new_user.password = params[:new_user][:password]
    new_user.username = params[:new_user][:username]

    # Confirm post is valid and save or return HTTP error
    if new_user.valid?
      new_user.save!
    else
      render "public/422", :status => 422
      return
    end

    # Respond with newly created post in json format
    respond_with(new_user) do |format|
      format.json { render :json => new_user.as_json }
    end

  end

end
