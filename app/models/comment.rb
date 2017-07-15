class Comment < ApplicationRecord
  belongs_to :job, optional: true
end
