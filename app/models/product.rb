class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :cost, :country_of_origin, presence: true

  before_save :titlize_name

  def avg_rating
    if reviews.any?
      reviews.sum(:rating) / reviews.count
    else
      0.0
    end
  end

  def titlize_name
    self.name = name.split.map(&:capitalize).join(' ')
  end
end