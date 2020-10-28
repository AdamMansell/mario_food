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
