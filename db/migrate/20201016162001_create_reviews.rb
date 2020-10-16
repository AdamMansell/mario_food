class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.column(:author, :string)
      t.column(:content_body, :string)
      t.column(:rating, :integer)
    end
  end
end
