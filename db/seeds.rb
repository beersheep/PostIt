# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'faker'
# include Faker

21.times do
  users = User.create(
    username: Faker::Internet.user_name
    )
end

21.times do 
  posts = Post.create(
    user_id: rand(21),
    title: Faker::Book.title,
    url: Faker::Internet.url,
    description: Faker::Hacker.say_something_smart
    )
end

10.times do
  categories = Category.create(
    name: Faker::Book.genre)
end

posts = Post.all

posts.each do |post|
  category = Category.all.shuffle!.pop
  post.categories << category
end


25.times do 
  comments = Comment.create(
    user_id: rand(21), 
    post_id: rand(21), 
    body: Faker::Hacker.say_something_smart
    )
end