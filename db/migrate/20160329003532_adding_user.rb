class AddingUser < ActiveRecord::Migration
  def change
      add_column :codes, :user_id, :integer
  end
end
