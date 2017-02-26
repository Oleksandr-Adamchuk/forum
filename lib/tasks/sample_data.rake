namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(username: "Iren",
                 email: "iren.mb@gmail.org",
                 password: "123123",
                 password_confirmation: "123123")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@gmail.org"
      password  = "password"
      User.create!(username: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end