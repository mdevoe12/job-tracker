require 'rails_helper'

RSpec.feature "When a user creates a new category" do
  scenario "they can create a new category" do
    category_title = "engineer"

    visit new_category_path
    fill_in "category_title", with: category_title
    click_on "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("engineer")
  end

  scenario "they input invalid informatio" do
    create(:category, title: "test")
    duplicate_category_title = "test"

    visit new_category_path
    fill_in "category_title", with: "test"
    click_on "Create Category"

    expect(page).to have_content("Create a new category")
  end
end
