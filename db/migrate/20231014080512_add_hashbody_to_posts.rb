class AddHashbodyToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :hashbody, :text
  end
end
