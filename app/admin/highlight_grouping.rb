ActiveAdmin.register HighlightGrouping do

  permit_params :highlight_id, :highlightable_type, :highlightable_id
  filter :highlightable, collection: Highlight.highlightables.map { |highlightable| [highlightable.identifier_s, highlightable.id] }
  filter :highlightable_type, collection: ["Destination", "Region", "Voyage"]
  filter :highlight

  index do
    selectable_column
    column :highlight
    column :highlightable_type
    column :highlightable
    actions
  end

  show do |fg|
    attributes_table do
      row :highlight
      row :highlightable_type
      row :highlightable
    end
  end

  form do |f|
    f.inputs "Highlight Grouping Details" do
      f.input :highlight
      f.input :highlightable_type, as: :select, collection: ["Destination", "Region", "Voyage"]
      f.input :highlightable_id, as: :select, collection: Highlight.highlightables.map { |highlightable| [highlightable.identifier_s, highlightable.id] }
    end
    f.actions
  end
end
