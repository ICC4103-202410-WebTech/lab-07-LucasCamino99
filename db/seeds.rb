# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

5.times do
    User.create!(
      name: Faker::Name.unique.name,
      email: Faker::Internet.unique.email,
      password: Faker::Internet.password
    )
  end

  User.all.each do |user|
    10.times do
      user.posts.create!(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph
      )
    end
  end

  tags = ['Technology', 'Travel', 'Food', 'Fashion', 'Sports']
  tags.each { |tag| Tag.create(name: tag) }

  Post.all.each do |post|
    post.tags << Tag.order('RANDOM()').first
  end
  
  

Post.delete_all
User.delete_all
