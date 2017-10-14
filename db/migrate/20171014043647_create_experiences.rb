class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.boolean :sponsored

      t.timestamps
    end
  end
end
