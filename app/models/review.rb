# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :product

  validates :author, :content_body, :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :content_body, length: { minimum: 50, maximum: 250 }
end
