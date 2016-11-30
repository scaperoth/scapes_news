class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :link, unique: true
      t.string :title
      t.text :description
      t.string :image
      t.text :categories
      t.datetime :pubdate
      t.belongs_to :news_source, index: true
      t.timestamps
    end
  end
end
