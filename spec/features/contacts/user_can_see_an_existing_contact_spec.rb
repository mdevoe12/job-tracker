require 'rails_helper'

RSpec.feature "A user can see an existing contact" do
  scenario "when they visit a company's page" do
    company = create(:company)
    contact = create(:contact, company_id: company.id)

    visit company_path(company)

    expect(page).to have_content(contact.full_name)
    expect(page).to have_content(contact.position)
    expect(page).to have_content(contact.email)
  end
end
