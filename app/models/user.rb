class User < ApplicationRecord

  has_secure_password
  has_many :jobs_applied, foreign_key: "job_id", class_name: "Job"
end
