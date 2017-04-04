module ApplicationHelper

  def popular_ships
    Ship.all
  end

  def popular_destinations
    Region.all
  end

end
