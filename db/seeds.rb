# if Rails.env.development?
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') #if Rails.env.development?
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# require 'csv'
#
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Cohort.csv'))
# #puts csv_text
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   c = Cohort.new
#   c.cohort = row['cohort']
#   c.genius = row['genius']
#   c.cell = row['cell']
#   c.email = row['email']
#   c.email2 = row['email2']
#   c.city = row['city']
#   c.save
#   puts "#{c.cohort}, #{c.genius}, #{c.cell}, #{c.email}, #{c.email2}, #{c.city} saved"
# end
# puts "There are now #{Cohort.count} rows in the cohort table"
# # Examples:
user = User.new({email: 'hodari@hgs.hiddengeniusproject.org', password: 'quiet927', password_confirmation: 'quiet927'})
user.save

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# admins = Admin.create!([{
#   email: 'hodari@hiddengeniusproject.org',
#   password: 'genius',
#   password_confirmation: 'genius'
#   admin: 'yes'
#   }])
%i[guest user staff director admin].each do |role|
  AdminUser.find_or_create_by!(email: "#{role}hodari@hiddengeniusproject.org") do |admin_user|
    admin_user.first_name = 'Hodari'
    admin_user.last_name = 'Toure'
    admin_user.role = 'admin'
    admin_user.password = 'quiet927'
    admin_user.password_confirmation = 'quiet927'
<<<<<<< HEAD
  end
end

%i[admin].each do |role|
  AdminUser.find_or_create_by!(email = "#{role}hodari@hiddengeniusproject.org") do |admin_user|
    admin_user.role = role
    admin_user.first_name = 'wpill'
    admin_user.last_name = 'wpill'
    admin_user.password = 'password'
    admin_user.password_confirmation = 'password'
=======
>>>>>>> old-state2
  end
end
# %i[admin].each do |role|
#   AdminUser.find_or_create_by!(email = "#{role}@genius.com") do |admin_user|
#     admin_user.role = role
#     admin_user.first_name = 'wpill'
#     admin_user.last_name = 'wpill'
#     admin_user.password = 'password'
#     admin_user.password_confirmation = 'password'
#   end
# end
AdminUser.create!(
  first_name: 'wpill'
  last_name: 'wpill'
  email: 'hodariAT@hiddengeniusproject'
  password: 'password'
  password_confirmation: 'password'
  admin: 'yes'
  )
end

AdminUser.create!(first_name = 'wpill', last_name = 'wpill', email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
