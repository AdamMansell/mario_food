# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.column(:name, :string)
      t.column(:cost, :integer)
      t.column(:country_of_origin, :string)
    end
  end
end
