require 'faker'

def seed_categories
  categories = ["Hover Cars", "Spaceship", 
                "Flying Carpets", "Jet Packs", 
                "Google Glasses", "Doo Hickeys"]

  categories.each do |category|
    Category.create(name: category)
  end
end


def seed_posts
  categories = Category.all
  100.times do
    category = categories.sample
    category.posts.create(title: Faker::Lorem.words(2), 
                          description: Faker::Lorem.paragraphs(3),
                          price: rand(59..999),
                          email: Faker::Internet.email)
  end
end

seed_categories
seed_posts