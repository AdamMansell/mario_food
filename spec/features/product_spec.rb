require 'rails_helper'

describe "Add a product" do
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', with: 'milk shake'
    fill_in 'Cost', with: 5
    fill_in 'Country of origin', with: 'United States'
    click_on 'Create Product'    
    expect(page).to have_content 'Milk Shake'
  end

  it "displays validation errors when field values are missing" do
    visit new_product_path
    click_on 'Create Product'   
    expect(page).to have_content 'Please fix the following errors, then try again'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Cost can't be blank"
    expect(page).to have_content "Country of origin can't be blank"    
  end
end

describe "Edit a product" do
  it "edits a product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'kung pao chicken'
    fill_in 'Cost', :with => 15
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    click_link 'Kung Pao Chicken', match: :first
    click_link 'Edit Product'
    fill_in 'Country of origin', :with => 'Canada'
    click_on 'Update Product'
    expect(page).to have_content 'Canada'
  end
end

describe "Delete a product" do
  it "deletes a product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Beer'
    fill_in 'Cost', :with => 1
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    click_link 'Beer', match: :first
    click_link 'Delete product'
    expect(page).to have_no_content 'Beer'
  end
end
