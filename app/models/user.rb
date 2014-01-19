class User

  attr_reader :fake_user_data

  private

    def self.fake_user_data
      @@data ||= (1..100).map do
        {
          id: Faker::Lorem.characters(64),
          favorite_count: Faker::Number.number(3),
          friend_count: Faker::Number.number(3),
          follower_count: Faker::Number.number(3),
          status_count: Faker::Number.number(3),
          listed_count: Faker::Number.number(3),
          name: Faker::Name.name,
          screenName: Faker::Internet.user_name,
          city: Faker::Address.city,
          language: "en"
        }
      end
    end
end