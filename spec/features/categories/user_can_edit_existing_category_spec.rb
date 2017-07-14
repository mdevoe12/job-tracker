require "rails_helper"

RSpec.feature "A user can edit an existing category" do
  scenario "when a user clicks edit from the index page" do
    cat = create(:category)
    new_name = "ninja"

    visit categories_path
    click_on "edit"
    fill_in "category_title", with: new_name
    click_on "Update Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("ninja")
  end

  scenario "when a user submits invalid params" do
    cat = create(:category, title: "ninja")
    dup_name = "ninja"

    visit categories_path
    click_on "edit"
    fill_in "category_title", with: dup_name
    click_on "Update Category"

    expect(page).to have_content("Edit #{cat.title}")
  end
end
