ActiveAdmin.register ActivityGrouping do

  permit_params :activity_id, :voyage_id
  filter :voyage, collection: Proc.new { Voyage.all.map { |voyage| [voyage.identifier_s, voyage.id] } }
  filter :activity, collection: Proc.new { Activity.all.map { |activity| [activity.identifier_s, activity.id] } }

  index do
    selectable_column
    column "Voyage" do |ag|
      link_to ag.voyage.identifier_s, admin_voyage_path(ag.voyage)
    end
    column "Activity" do |ag|
      link_to ag.activity.identifier_s, admin_activity_path(ag.activity)
    end
    actions
  end

  show do |ag|
    attributes_table do
      row :voyage do
        link_to ag.voyage.identifier_s, admin_voyage_path(ag.voyage)
      end
      row :activity do
        link_to ag.activity.identifier_s, admin_activity_path(ag.activity)
      end
    end
  end

  form do |f|
    f.inputs "Activity Grouping Details" do
      f.input :activity_id, as: :select, collection: Proc.new { Activity.all.map { |activity| [activity.identifier_s, activity.id] } }
      f.input :voyage_id, as: :select, collection: Proc.new { Voyage.all.map { |voyage| [voyage.identifier_s, voyage.id] } }
    end
    f.actions
  end
end
