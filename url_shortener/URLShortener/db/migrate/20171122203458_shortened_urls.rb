class ShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortend_urls do |t|
      t.string :long_url, null: false
      t.string :short_url, null: false
      t.integer :user_id, null: false      
    end
    
    add_index :shortend_urls, :user_id
    
  end
end
