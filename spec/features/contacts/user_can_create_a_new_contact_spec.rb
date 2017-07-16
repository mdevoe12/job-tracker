require 'rails_helper'

RSpec.feature "A user can create a new contact" do
  scenario "when they fill out form information on the company page" do
    company = create(:company)
    contact = build(:contact)

    visit company_path(company)
    fill_in "contact_full_name", with: contact.full_name
    fill_in "contact_position", with: contact.position
    fill_in "contact_email", with: contact.email
    click_on "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content(contact.full_name)
    expect(page).to have_content(contact.position)
    expect(page).to have_content(contact.email)
  end
end
