class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :job_users
  has_many :jobs, through: :job_users
  has_one :job_application

  def full_name

  end

  def city_state
  
  end


end
