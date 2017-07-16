require 'rails_helper'

RSpec.feature "A user visits dashboard" do
  scenario "and sees a count of jobs by level of interest" do
    job_1 = create(:job)
    job_2 = create(:job)
    job_3 = create(:job)

    visit 'dashboard'

    expect(page).to have_content("Level of Interest")
    expect(page).to have_content("Job Count")
    expect(page).to have_content(job_1.level_of_interest)
    expect(page).to have_content(job_2.level_of_interest)
    expect(page).to have_content(job_3.level_of_interest)
  end

  scenario "a user sees the top three companies ranked by interest" do
    company_1 = create(:company, name: "Google")
    company_2 = create(:company, name: "Uber")
    company_3 = create(:company, name: "Dunkin Donuts")
    company_4 = create(:company, name: "REI")
    job_1 = create(:job, company_id: company_1.id, level_of_interest: 90)
    job_2 = create(:job, company_id: company_2.id, level_of_interest: 85)
    job_3 = create(:job, company_id: company_3.id, level_of_interest: 80)
    job_4 = create(:job, company_id: company_4.id, level_of_interest: 5)

    visit 'dashboard'

    expect(page).to have_content("Avg. Interest Level:")
    expect(page).to have_content("Google")
    expect(page).to have_content("Uber")
    expect(page).to have_content("Dunkin Donuts")
    expect(page).to_not have_content("REI")
  end

  scenario "a user sees count of jobs by location" do
    job_1 = create(:job, city: "Denver")
    job_2 = create(:job, city: "Denver")
    job_3 = create(:job, city: "Austin")

    visit 'dashboard'

    expect(page).to have_content("Job count by location:")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Austin")
  end

  scenario "a user can link to a location and see a list of jobs" do
    job_1 = create(:job, city: "Denver")
    job_2 = create(:job, city: "Denver")
    job_3 = create(:job, city: "Austin")

    visit 'dashboard'

    click_on "Denver"

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
  end
end
