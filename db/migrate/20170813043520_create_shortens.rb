class CreateShortens < ActiveRecord::Migration
  def change
    create_table :shortens do |t|
      t.string :original_url
      t.string :tiny_url

      t.timestamps null: false
    end
  end
end
