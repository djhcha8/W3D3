class RenameShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    rename_table "shortend_urls", "shortened_urls"
  end
end
