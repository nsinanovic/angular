class KategorijasController < ApplicationController
  respond_to :json

  def index

    # Gather all post data
    kategorijas = Kategorija.all

    # Respond to request with post data in json format
    respond_with(kategorijas) do |format|
      format.json { render :json => kategorijas.as_json }
    end

  end
def new

end

  def create
    # Create and save new post from data received from the client
    new_kategorija = Kategorija.new
    new_kategorija.title = params[:new_kategorija][:title] # Get only first 250 characters


    # Confirm post is valid and save or return HTTP error
    if new_kategorija.valid?
      new_kategorija.save!
    else

      return
    end

    # Respond with newly created post in json format
    respond_with(new_kategorija) do |format|
      format.json { render :json => new_kategorija.as_json }
    end

  end
end

# Create and save new post from data received from the client




