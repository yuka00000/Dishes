class CreatePostHashtagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_hashtag_relations do |t|
      t.references :post, foreign_key: true
      t.references :hashtag, foreign_key: true
      t.timestamps
    end
  end
end
