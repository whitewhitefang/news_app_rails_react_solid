# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#

puts "Seed not hidden articles examples"
5.times do |n|
  Article.find_or_create_by!(header: "Seeded news ##{n}", body: "Some words about news ##{n}", published: true)
end

puts "Seed hidden articles examples"
3.times do |n|
  Article.find_or_create_by!(header: "Seeded news ##{n}", body: "Some words about news ##{n}", published: false)
end

puts "Seed images"
2.times do |n|
  image_path = Rails.root.join("public/images", "news.jpg")
  
  if File.exist?(image_path)
    article = Article.find_or_create_by!(header: "Seeded news ##{n} with image", body: "Some words about news", published: true)
    article.image.attach(io: File.open(image_path), filename: "image_news#{n}.jpg")
  else
    puts "Image not found: #{image_path}"
  end
end

puts "Seed admin user(s)"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?