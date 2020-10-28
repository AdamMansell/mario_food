# frozen_string_literal: true

require 'rails_helper'

describe Product do
  describe 'associations' do
    it { should have_many :reviews }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
    it { should validate_presence_of :country_of_origin }
  end

  context 'titlize name by a callback when product is created' do
    it 'titlizes the name of a product' do
      product = Product.create(name: 'oatmeal bread apple hotdog', cost: 30, country_of_origin: 'United States')
      expect(product.name).to eq('Oatmeal Bread Apple Hotdog')
    end
  end

  describe '#avg_rating' do
    context 'product has 2 reviews' do
      product = Product.create(name: 'oatmeal bread apple hotdog', cost: 30, country_of_origin: 'United States')
      product.reviews.create!(author: Faker::Name.name, content_body: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false), rating: 5)
      product.reviews.create!(author: Faker::Name.name, content_body: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false), rating: 3)

      it 'returns the correct avg rating for the product' do
        expect(product.avg_rating).to eq 4
      end
    end

    context 'product has 3 reviews' do
      product = Product.create(name: 'oatmeal bread apple hotdog', cost: 30, country_of_origin: 'United States')
      product.reviews.create!(author: Faker::Name.name, content_body: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false), rating: 5)
      product.reviews.create!(author: Faker::Name.name, content_body: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false), rating: 3)
      product.reviews.create!(author: Faker::Name.name, content_body: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false), rating: 1)

      it 'returns the correct avg rating for the product' do
        expect(product.avg_rating).to eq 3
      end
    end
  end
end
