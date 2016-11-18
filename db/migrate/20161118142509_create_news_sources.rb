class CreateNewsSources < ActiveRecord::Migration
  def change
    create_table :news_sources do |t|

      t.timestamps
    end
  end
end
