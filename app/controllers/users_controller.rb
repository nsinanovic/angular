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
    if !params[:new_user].blank?
      new_user = User.new
      new_user.email = params[:new_user][:email][0...250] # Get only first 250 characters
      new_user.password = params[:new_user][:password]
      new_user.name = params[:new_user][:name]
      new_user.lastname = params[:new_user][:lastname]
      new_user.phone = params[:new_user][:phone]
      new_user.address = params[:new_user][:address]

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
    elsif !params[:edit_user].blank?
      # Edit and save new post from data received from the client
      edit_user = User.find_by_id(params[:edit_user][:id])
      edit_user.email = params[:edit_user][:email][0...250] # Get only first 250 characters
      edit_user.name = params[:edit_user][:name]
      edit_user.lastname = params[:edit_user][:lastname]
      edit_user.phone = params[:edit_user][:phone]
      edit_user.address = params[:edit_user][:address]
      edit_user.password = params[:edit_user][:password]

      # Confirm post is valid and save or return HTTP error
      if edit_user.valid?
        edit_user.save!
      else
        render "public/422", :status => 422
        return
      end

      # Respond with edited post in json format
      respond_with(edit_user) do |format|
        format.json { render :json => edit_user.as_json }
      end
    else
      # if delete request
      delete_user = User.find_by_id(params[:delete_user][:id])
      # Confirm post is valid and save or return HTTP error
      if !delete_user.blank?
        delete_user.destroy!
      else
        render "public/422", :status => 422
        return
      end
      # Respond with edited post in json format
      respond_with(delete_user) do |format|
        format.json { render :json => delete_user.as_json }
      end
    end
  end

  def edit
    # Edit and save new post from data received from the client
    edit_user = User.find_by_id(params[:id])
    edit_user.email = params[:edit_user][:email]
    edit_user.password = params[:edit_user][:password]
    edit_user.name = params[:edit_user][:name]
    edit_user.lastname = params[:edit_user][:lastname]
    edit_user.phone = params[:edit_user][:phone]
    edit_user.address = params[edit_user][:address]


    # Confirm post is valid and save or return HTTP error
    if edit_user.valid?
      edit_user.save!
    else
      render "public/422", :status => 422
      return
    end

    # Respond with edited post in json format
    respond_with(edit_user) do |format|
      format.json { render :json => edit_user.as_json }
    end
  end



end
