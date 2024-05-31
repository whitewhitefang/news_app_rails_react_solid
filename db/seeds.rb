# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#

puts "Seed not hidden articles examples in"
5.times do |n|
  Article.find_or_create_by!(header: "Seeded news ##{n}", body: "Some words about news ##{n}", published: true)
end

puts "Seed hidden articles examples in"
3.times do |n|
  Article.find_or_create_by!(header: "Seeded news ##{n}", body: "Some words about news ##{n}", published: false)
end

puts "Seed admin user in"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?