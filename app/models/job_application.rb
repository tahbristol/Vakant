class JobApplication < ApplicationRecord
  belongs_to :user

  has_one :profile


 def profile_attributes=(attributes)
   if self.profile.present?
     self.profile.update(attributes)
   else
     self.build_profile(attributes)
     self.save
   end
 end

end
