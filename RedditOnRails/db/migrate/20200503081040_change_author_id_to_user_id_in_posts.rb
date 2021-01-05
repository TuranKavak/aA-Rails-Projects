class ChangeAuthorIdToUserIdInPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :author_id, :user_id
  end
end
