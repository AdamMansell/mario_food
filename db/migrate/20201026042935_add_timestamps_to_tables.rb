class AddTimestampsToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :created_at, :datetime, null: false
    add_column :products, :updated_at, :datetime, null: false
    add_column :reviews, :created_at, :datetime, null: false
    add_column :reviews, :updated_at, :datetime, null: false
  end
end
