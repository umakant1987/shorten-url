class AddUserIdToShortens < ActiveRecord::Migration
  def change
    add_column :shortens, :user_id, :integer
  end
end
