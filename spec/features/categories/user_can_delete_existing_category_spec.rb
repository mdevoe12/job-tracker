require "rails_helper"

RSpec.feature "A user can delete a category" do
  scenario "when a user clicks delete from index" do
    cat_1 = create(:category)
    cat_2 = create(:category)
    cat_3 = create(:category)

    visit categories_path
    expect(page).to have_content(cat_1.title)
    expect(page).to have_content(cat_2.title)
    expect(page).to have_content(cat_3.title)

    first(:link, "delete").click

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content(cat_1.title)
    expect(page).to have_content(cat_2.title)
    expect(page).to have_content(cat_3.title)
  end
end
