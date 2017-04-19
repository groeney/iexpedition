module ApplicationHelper

  def popular_ships
    Ship.all
  end

  def popular_regions
    Region.all
  end

end
