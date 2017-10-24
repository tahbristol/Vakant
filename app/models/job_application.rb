class JobApplication < ApplicationRecord
  belongs_to :user
  
  has_one :profile
end
