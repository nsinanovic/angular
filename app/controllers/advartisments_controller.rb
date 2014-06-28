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
      if !params[:new_advartisment].blank?
        new_advartisment = Advartisment.new
        new_advartisment.title = params[:new_advartisment][:title][0...250] # Get only first 250 characters
        new_advartisment.description = params[:new_advartisment][:description]
        new_advartisment.location = params[:new_advartisment][:location]
        new_advartisment.category = params[:new_advartisment][:category]
        new_advartisment.expire = params[:new_advartisment][:expire]
        new_advartisment.published = params[:new_advartisment][:published]
        new_advartisment.employer = current_employer.name


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

      elsif !params[:edit_advartisment].blank?
        edit_advartisment = Advartisment.find_by_id(params[:edit_advartisment][:id])
        edit_advartisment.title = params[:edit_advartisment][:title]
        edit_advartisment.description = params[:edit_advartisment][:description]
        edit_advartisment.location = params[:edit_advartisment][:location]
        edit_advartisment.category = params[:edit_advartisment][:category]
        edit_advartisment.expire = params[:edit_advartisment][:expire]
        edit_advartisment.employer = current_employer.name


        # Confirm post is valid and save or return HTTP error
        if edit_advartisment.valid?
          edit_advartisment.save!
        else
          render "public/422", :status => 422
          return
        end

        # Respond with newly created post in json format
        respond_with(edit_advartisment) do |format|
          format.json { render :json => edit_advartisment.as_json }
        end
      else
        # if delete request
        delete_advartisment = Advartisment.find_by_id(params[:delete_advartisment][:id])
        # Confirm post is valid and save or return HTTP error
        if !delete_advartisment.blank?
          delete_advartisment.destroy!
        else
          render "public/422", :status => 422
          return
        end
        # Respond with edited post in json format
        respond_with(delete_advartisment) do |format|
          format.json { render :json => delete_advartisment.as_json }
        end
      end

    end

  end
