class CreateShortenUrls < ActiveRecord::Migration
  def change
    create_table :shorten_urls do |t|
      t.string :original_url
      t.string :shortened_url

      t.timestamps null: false
    end
  end
end
