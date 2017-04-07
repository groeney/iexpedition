class DestinationsController < ApplicationController
  def show
    @destination = Destination.find(params[:id])
  end

  def antarctica
    @destination = Destination.find_by_name("Antarctica")
    render 'show'
  end

  def arctic
    @destination = Destination.find_by_name("The Arctic")
    render 'show'
  end
end
