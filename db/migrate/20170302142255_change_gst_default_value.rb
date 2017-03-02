class ChangeGstDefaultValue < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :voyages do |t|
        dir.up { t.change_default :gst, 0.0 }
        dir.up do
          Voyage.all.each do |v|
            v.update_attributes(gst: 0.0) if v.gst.nil?
          end
        end

        dir.down { t.change_default :gst, nil }
        dir.down do
          Voyage.all.each do |v|
            v.update_attributes(gst: nil) if v.gst.eql? 0.0
          end
        end
      end
    end
  end
end
