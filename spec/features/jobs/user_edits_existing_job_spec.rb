require 'spec_helper'

RSpec.feature "User can edit an existing job" do
  scenario "by clicking on edit from job page" do
    company = create(:company)
    job = create(:job, company_id: company.id)
    cat = create(:category, title: "ninja")

    visit edit_company_job_path(company, job)
    fill_in "job_title", with: "changed title"
    fill_in "job_description", with: "fancy fancy"
    fill_in "job_level_of_interest", with: 4
    fill_in "job_city", with: "Boulder"
    select "ninja", from: "job_category_id"
    click_on "Update Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("changed title")
    expect(page).to_not have_content("engineer")
    expect(page).to have_content("fancy fancy")
    expect(page).to have_content(4)
    expect(page).to have_content("Boulder")
    expect(page).to have_content("ninja")
  end
end
