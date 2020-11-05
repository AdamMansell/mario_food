# frozen_string_literal: true

require 'rails_helper'

describe 'Add a review' do
  before do
    user = User.create(admin: true, email: 'admin@example.com', password: 'test1234')
    login_as(user, scope: :user)
  end

  it 'adds a new review' do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', with: 'dog food'
    fill_in 'Cost', with: 20
    fill_in 'Country of origin', with: 'United States'
    click_button 'Create Product'
    click_link 'Dog Food', match: :first
    click_link 'Add a review'
    fill_in 'Author', with: 'Miguel'
    fill_in 'Content', with: "This stuff is awesome, my kids can't even tell it's dog food."
    fill_in 'Rating', with: '5'
    click_button 'Create Review'
    expect(page).to have_content "This stuff is awesome, my kids can't even tell it's dog food."
  end

  describe 'Show product reviews' do
    before do
      user = User.create(admin: false, email: 'admin@example.com', password: 'test1234')
      login_as(user, scope: :user)
    end

    it 'displays the reviews of a product' do
      product = Product.create!(name: 'Mango Milk Shake', country_of_origin: 'USA', cost: 10)
      review_content_body_1 = 'Tastes just like a real mango even though it is a bunch of chemicals that have no actual mango in it at all.'
      review_content_body_2 = 'You would expect the shake to be a nice orange color but instead it is more of a green and brown color and is quite off putting.'
      product.reviews.create!(author: Faker::Name.name, content_body: review_content_body_1, rating: 5)
      product.reviews.create!(author: Faker::Name.name, content_body: review_content_body_2, rating: 3)

      visit "/products/#{product.id}"

      expect(page).to have_content 'Mango Milk Shake'
      expect(page).to have_content 'Cost: $ 10'
      expect(page).to have_content 'Country of Origin: USA'
      expect(page).to have_content 'Average Rating: 4'

      expect(page).to have_content 'Here are the reviews for this product:'
      expect(page).to have_content review_content_body_1
      expect(page).to have_content review_content_body_2
    end
  end

  describe 'Show a particular review' do
    before do
      user = User.create(admin: false, email: 'admin@example.com', password: 'test1234')
      login_as(user, scope: :user)
    end

    it 'displays a particular review of a product' do
      product = Product.create!(name: 'Mango Milk Shake', country_of_origin: 'USA', cost: 10)
      review_content_body = 'Tastes just like a real mango even though it is a bunch of chemicals that have no actual mango in it at all.'
      review = product.reviews.create!(author: 'Adam', content_body: review_content_body, rating: 5)

      visit "/products/#{product.id}/reviews/#{review.id}"

      expect(page).to have_content "Review of the Product: #{product.name}"
      expect(page).to have_content 'Author: Adam'
      expect(page).to have_content "Content Body: #{review_content_body}"
      expect(page).to have_content 'Rating: 5'
    end
  end
end
