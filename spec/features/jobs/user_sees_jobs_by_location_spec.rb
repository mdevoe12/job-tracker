require 'rails_helper'

RSpec.feature "A user can see jobs by city" do
  scenario "when they visit /jobs with location params filled in" do
    job_1 = create(:job)
    job_2 = create(:job)
    job_3 = create(:job)
    job_4 = create(:job, city: "Denver")

    visit "/jobs?sort=city%20of%20dreams"

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
    expect(page).to have_content(job_3.title)
    expect(page).to_not have_content(job_4.title)
  end
end
