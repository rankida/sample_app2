namespace :db do
	desc "Fill database with sample data"
	task populate_many: :environment do
		admin = User.create!(name: "David Rankin",
												 email: "rankida@gmail.com",
												 password: "foobar",
												 password_confirmation: "foobar")
		admin.toggle!(:admin)

		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@rankida.com"
			password = "password"
			User.create!(name: name,
									 email: email,
									 password: password,
									 password_confirmation: password)
		end

		users = User.all(limit: 6)
		50.times do
			content = Faker::Lorem.sentence(5)
			users.each { |user| user.microposts.create!(content: content) }
		end
	end

	task populate_rankida: :environment do
		rankida = User.create!(name: "David Rankin",
												 email: "rankida@gmail.com",
												 password: "foobar",
												 password_confirmation: "foobar")
		rankida.toggle!(:admin)
	end
end