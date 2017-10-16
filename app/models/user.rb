class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :job_users
  has_many :jobs, through: :job_users
  has_one :job_application
  has_attached_file :user_photo, default_url: ':style/default.png', styles: { thumb: "200x200>" }
  validates_attachment_content_type :user_photo, content_type: /\Aimage\/.*\z/

  def full_name
    if self.job_application
      job_app = self.job_application
      "#{job_app.first_name} #{job_app.last_name}"
    end
  end

  def city_state
    job_app = self.job_application
    #binding.pry

    "#{job_app.city}, #{job_app.state} #{job_app.phone}"
  end
end
