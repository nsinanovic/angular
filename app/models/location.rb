class Location < ActiveRecord::Base
  acts_as_gmappable

  def gmaps4rails_address
    address
  end
  private

  def location_params
    params.require(:location).permit( :address, :latitude, :longitude, :name)
  end
end