require 'rails_helper'

RSpec.feature "When a user visits a category show page" do
  scenario "they will see the category and related jobs" do
    job = create(:job)

    visit categories_path


    click_on "#{job.category.title}"

    expect(current_path).to eq(category_path(job.category))
    expect(page).to have_content("#{job.category.title}")
    expect(page).to have_content("#{job.title}")
  end
end
