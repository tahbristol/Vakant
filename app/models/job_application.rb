class JobApplication < ApplicationRecord
  belongs_to :user

  has_one :profile
  accepts_nested_attributes_for :profile



end
