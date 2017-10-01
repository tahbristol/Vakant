# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
   => create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "description"
    t.string "level"
    t.string "salary"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
=end


User.create(email:"Tyler@bristol.com", password:"password1")
User.create(email:"Ali@isa.com", password:"password2")
User.create(email:"Sufyan@Junayd", password:"password3")

o1 = Organization.create(name:"Google", location:"CA")
o2 = Organization.create(name:"Microsoft", location:"WA")



j1 = Job.create(title:"Software Developer", location:"CA", organization: o1)
j2 = Job.create(title:"Market Research Analysist", location:"CA", organization: o2)
