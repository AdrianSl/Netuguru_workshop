User.create!(firstname:  "Admin",
             lastname:  "User",
             email: "user@example.org",
             password:              "password",
             password_confirmation: "password",
             admin:     true)

5.times do |n|
  firstname  = Faker::Name.first_name
  lastname  = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(firstname:  firstname,
               lastname:  lastname,
               email: email,
               password:              password,
               password_confirmation: password)
end

Category.create!(name:  "Test category")

category_id = Category.first.id.to_i
users = User.order(:created_at).take(3)
3.times do
  users.each do |user|
    user.products.create!(title: Faker::Lorem.word,
                          description: Faker::Lorem.sentence(20),
                          price: rand(1..99),
                          category_id: category_id)
  end
end

products = Product.order(:created_at).take(8)

  products.each do |product|
    users.each do |user|
      user.reviews.create!(content: Faker::Lorem.sentence(20),
                            rating: rand(1..5),
                            product_id: product.id)
    end
  end
