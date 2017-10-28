class Profile < ApplicationRecord
  has_many :addresses
  belongs_to :job_application
  
  has_attached_file :user_photo, default_url: ':style/default.png', styles: {medium: "200x200>", thumb: "100x100>" }
  validates_attachment_content_type :user_photo, content_type: /\Aimage\/.*\z/
end
