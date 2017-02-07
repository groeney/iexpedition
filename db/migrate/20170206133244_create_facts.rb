class CreateFacts < ActiveRecord::Migration[5.0]
  def change
    create_table :facts do |t|
      t.text :question
      t.text :answer
      t.text :more_info
      t.attachment :image

      t.references :destination, foreign_key: true
      t.timestamps
    end
  end
end
