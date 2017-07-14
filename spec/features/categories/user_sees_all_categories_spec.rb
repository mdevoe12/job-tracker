require "spec_helper"

RSpec.feature "A user can see all categories" do
  scenario "when they visit the category index" do
    cat_1 = create(:category)
    cat_2 = create(:category)
    cat_3 = create(:category)

    visit categories_path

    expect(page).to have_content(cat_1.title)
    expect(page).to have_content(cat_2.title)
    expect(page).to have_content(cat_3.title)
  end
end
