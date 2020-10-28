require 'rails_helper'

describe "Add a review" do
  it "adds a new review" do
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
end