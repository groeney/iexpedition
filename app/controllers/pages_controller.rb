class PagesController < ApplicationController
  def search
    @results = Voyage.all.group_by(&:name)
  end

  def ship_listing
    @results = Ship.all
  end

  def bug
    @voyage = Voyage.first
  end
end
