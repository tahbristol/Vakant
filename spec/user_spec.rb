require 'spec_helper'

RSpec.describe User, :type => :model do

    user = User.create(
      :email => "test@email.com",
      :password => "password1",
      :password_confirmation => "password1"
    )

    org = Organization.create(name: "org_name")



it "is valid with email, password, password_confirmation" do
  expect(user).to be_valid
end

it "has many jobs" do
  first_job = Job.create
  second_job = Job.create
  first_job.organization = org
  second_job.organization = org
  user.jobs << [first_job, second_job]
  expect(user.jobs.first).to eq(first_job)
  expect(user.jobs.second).to eq(second_job)

end



end
