module ApplicationHelper

  def popular_ships
    Ship.all
  end

  def popular_regions
    Region.all
  end

  def not_dashboard?
    controller_name != 'dashboard'
  end

end
