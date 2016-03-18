class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :kind
      t.string :language
      t.string :purpose
      t.string :content
    end
  end
end
