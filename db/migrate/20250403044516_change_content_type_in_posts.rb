class ChangeContentTypeInPosts < ActiveRecord::Migration[8.0]
  def change
      change_column :posts, :content, :text
  end
end
