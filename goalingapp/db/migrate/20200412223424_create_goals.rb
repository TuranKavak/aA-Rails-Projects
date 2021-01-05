class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: false, index: true
      t.boolean :private, null: false, default: false
      t.text :details
      t.boolean :completed, null: false, default: false
      t.integer :user_id, null: false, index: true
    end
  end
end
