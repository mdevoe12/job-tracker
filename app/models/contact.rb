class Contact < ApplicationRecord
  belongs_to :company, optional: true
end
