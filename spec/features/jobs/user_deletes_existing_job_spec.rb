require 'rails_helper'

RSpec.feature "User visits job index" do
  scenario "user can delete an existing job" do
    company_1 = create(:company)
    job_1 = create(:job, company_id: company_1.id)
    job_2 = create(:job, company_id: company_1.id)

    visit company_jobs_path(company_1)
    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)

    visit company_job_path(company_1, job_1)
    click_on "delete"

    expect(current_path).to eq(company_jobs_path(company_1))
    expect(page).to have_content(job_2.title)
    expect(page).to_not have_content(job_1.title)
  end
end
