class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :author_id, null: false, index: true
      t.integer :commentable_id, null: false, index: true
      t.string :commentable_type, null: false

      t.timestamps
    end
  end
end
