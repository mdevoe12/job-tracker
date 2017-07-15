require 'rails_helper'

RSpec.feature "A user can create a new comment" do
  scenario "when they visit a job and create a new comment" do
    job = create(:job)
    visit company_job_path(job.company.id, job.id)
    fill_in "comment_user", with: "Jack's Spleen"
    fill_in "comment_content", with: "I am Jack's raging spleen"
    click_on "Submit"

    expect(current_path).to eq(company_job_path(job.company.id, job.id))
    expect(page).to have_content("Jack's Spleen")
  end
end
