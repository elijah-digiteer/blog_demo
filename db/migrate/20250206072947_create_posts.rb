class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.datetime :published_at
      t.boolean :active
      t.boolean :featured

      t.timestamps
    end
  end
end
