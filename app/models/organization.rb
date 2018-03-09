class Organization < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :jobs
  has_one :profile



	def org_profile
		{:name => self.name, :location => self.location, :email => self.email}.compact
	end
end
