class CreateCheckin < ActiveRecord::Migration[5.1]
  def change
    create_table :checkins do |t|
      #big int :limit => 8
      t.integer :user_id,       null: false, :limit => 8
      t.integer :experience_id, null: false, :limit => 8
      t.timestamps
    end
    add_foreign_key :checkins, :users
    add_foreign_key :checkins, :experiences
  end
end
