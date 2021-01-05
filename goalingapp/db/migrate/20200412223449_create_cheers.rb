class CreateCheers < ActiveRecord::Migration[5.2]
  def change
    create_table :cheers do |t|
      t.integer :giver_id, null: false, index: true
      t.integer :goal_id, null: false

      t.timestamps
    end
    add_index :cheers, %i(goal_id giver_id), unique: true
  end
end
