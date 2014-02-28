class LocationsController < ApplicationController
  def new
  end

  def search
    cell_id = CellId.new
    result = cell_id.process_location(params[:mcc], params[:mnc], params[:lac], params[:cell_id])
    if result[:status] == 'fail'
      flash[:warning] = result[:reason]
    else
      @geo_location = {:lat => result[:lat], :lon => result[:lon]}
    end
#    http://maps.googleapis.com/maps/api/geocode/json?latlng=44.4647452,7.3553838&sensor=true
  end
end
