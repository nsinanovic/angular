class AdvartismentsController < ApplicationController

    respond_to :json

    def index

      # Gather all post data
      advartisments = Advartisment.all

      # Respond to request with post data in json format
      respond_with(advartisments) do |format|
        format.json { render :json => advartisments.as_json }
      end

    end


    def create

      # Create and save new post from data received from the client
      new_advartisment = Advartisment.new
      new_advartisment.title = params[:new_advartisment][:title][0...250] # Get only first 250 characters
      new_advartisment.description = params[:new_advartisment][:description]
      new_advartisment.location = params[:new_advartisment][:location]
      new_advartisment.category = params[:new_advartisment][:category]
      new_advartisment.expire = params[:new_advartisment][:expire]

      # Confirm post is valid and save or return HTTP error
      if new_advartisment.valid?
        new_advartisment.save!
      else
        render "public/422", :status => 422
        return
      end

      # Respond with newly created post in json format
      respond_with(new_advartisment) do |format|
        format.json { render :json => new_advartisment.as_json }
      end

    end

  end
