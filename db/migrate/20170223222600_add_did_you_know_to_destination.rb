class AddDidYouKnowToDestination < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :did_you_know, :text
  end
end
