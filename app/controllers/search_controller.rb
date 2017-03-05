class SearchController < ApplicationController
  def voyages
    voyage_filter_params
    @destination = Destination.find((@voyage_filter_params[:destinations] || 1))
    @results = Voyage.filter_and(@voyage_filter_params).group_by(&:name)
  end

  def antarctica
    voyage_filter_params
    @destination = Destination.find_by_name("Antarctica")
    @results = Voyage.destinations(@destination.id).group_by(&:name)
    render "voyages"
  end

  def arctic
    voyage_filter_params
    @destination = Destination.find_by_name("The Arctic")
    @results = Voyage.destinations(@destination.id).group_by(&:name)
    render "voyages"
  end

  def ships
    ship_filter_params
    @results = Ship.filter_and(@ship_filter_params)
  end

  protected

  def voyage_filter_params
    @voyage_filter_params ||= params.fetch(:search, {})
      .permit(:destinations, :departure_date, :duration, :price, :passenger_capacity => [], :regions => [], :names => [], :ships => [], :embark_ports => [], :highlight_names => [], :activity_names => [])
      .delete_if { |k,v| v.blank? }
    clean_voyage_filter_params
  end

  def ship_filter_params
    @ship_filter_params ||= params.fetch(:search, {})
      .permit(:destinations => [], :ships => [], :categories => [], :passenger_capacity => [])
    clean_ship_filter_params
  end

  ############### Clean params methods ################################

  def clean_voyage_filter_params
    clean_passenger_capacity(@voyage_filter_params)
  end

  def clean_ship_filter_params
    clean_passenger_capacity(@ship_filter_params)
    clean_destinations(@ship_filter_params)
  end

  ################### Clean attribute methods ############################

  def clean_passenger_capacity(filter_params)
    if (p_cap = filter_params[:passenger_capacity])
      filter_params[:passenger_capacity] = JSON(p_cap.try(:first))
    end
  end

  def clean_destinations(filter_params)
    destinations = filter_params[:destinations]
    if destinations.is_a? Array
      destinations = destinations.first.to_i
    elsif destinations.is_a? String
      destinations = destinations.to_i
    else
      destinations = Destination.all.pluck(:id) # default to all destinations
    end
    filter_params[:destinations] = destinations
  end
end
