class AddUserIdToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user, foreign_key: true
  end
  def up
    execute 'DELETE FROM posts;'
    add_reference :posts, :user,  index: true
  end

  def down
    remove_reference :posts, :user, index: true
  end
end
