class NotificationsController < ApplicationController
  respond_to :json


  def new
    @notification = Notification.new
  end




  def index

    # Gather all post data
    notifications = Notification.all

    # Respond to request with post data in json format
    respond_with(notifications) do |format|
      format.json { render :json => notifications.as_json }
    end

  end

  def create
    # Create and save new post from data received from the client
    if !params[:new_notification].blank?
      new_notification = Notification.new
      new_notification.user_id = current_user.id

      new_notification.kategorija= params[:new_notification][:kategorija]


      # Confirm post is valid and save or return HTTP error
      if new_notification.valid?
        new_notification.save!
      else
        render "public/422", :status => 422
        return
      end

      # Respond with newly created post in json format
      respond_with(new_notification) do |format|
        format.json { render :json => new_notification.as_json }
      end
    elsif !params[:edit_notification].blank?
      # Edit and save new post from data received from the client
      edit_notification = User.find_by_id(params[:edit_notification][:id])
      edit_notification.user_id = params[:edit_notification][:user_id][0...250] # Get only first 250 characters

      edit_notification.kategorija = params[:edit_notification][:kategorija]


      # Confirm post is valid and save or return HTTP error
      if edit_notification.valid?
        edit_notification.save!
      else
        render "public/422", :status => 422
        return
      end

      # Respond with edited post in json format
      respond_with(edit_notification) do |format|
        format.json { render :json => edit_user.as_json }
      end
    else
      # if delete request
      delete_notification = Notification.find_by_id(params[:delete_notification][:id])
      # Confirm post is valid and save or return HTTP error
      if !delete_notification.blank?
        delete_notification.destroy!
      else
        render "public/422", :status => 422
        return
      end
      # Respond with edited post in json format
      respond_with(delete_notification) do |format|
        format.json { render :json => delete_notification.as_json }
      end
    end
  end

  def edit
    # Edit and save new post from data received from the client
    edit_notification = Notification.find_by_id(params[:id])
    edit_notification.user_id = params[:edit_notification][:user_id]
    edit_notification.kategorija_id= params[:edit_notification][:kategorija_id]
    edit_notification.kategorija= params[:edit_notification][:kategorija]


    # Confirm post is valid and save or return HTTP error
    if edit_notification.valid?
      edit_notification.save!
    else
      render "public/422", :status => 422
      return
    end

    # Respond with edited post in json format
    respond_with(edit_notification) do |format|
      format.json { render :json => edit_notification.as_json }
    end
  end



end
