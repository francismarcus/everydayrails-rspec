FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name "Marcus"
    last_name "Magnusson"
    sequence(:email) { |n| "tester#{n}@bredband2.se"}
    password "myPassword"
  end
end
