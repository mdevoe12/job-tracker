require 'rails_helper'

RSpec.feature "A user can see an existing comment" do
  scenario "when visiting the job path" do
    job = create(:job)
    comment = create(:comment, job_id: job.id)

    visit company_job_path(job.company, job)

    expect(page).to have_content(comment.user)
    expect(page).to have_content(comment.content)
  end
end
