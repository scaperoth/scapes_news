class CreateNewsSources < ActiveRecord::Migration
  def change
    create_table :news_sources do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
  end
end
