FactoryBot.define do
  factory :user do
    firstname  { FFaker::Name.first_name }
    lastname  { FFaker::Name.last_name }
    email  { FFaker::Internet.email }

    after(:build) do |user|
      [:email, :homework].each do |task|
        user.tasks << FactoryBot.build(task, user: user)
      end
    end
  end
end
