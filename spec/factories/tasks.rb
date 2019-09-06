FactoryBot.define do
  factory :task do
    association :user
    name "buy beer"
    due_date { DateTime.now }
    priority 2

    factory :vote do
      association :user
      name 'vote'
      due_date { DateTime.now }
      priority 1
    end

    factory :invalid_task do
      association :user
      name nil
      due_date
      priority nil
    end
  end

  factory :homework, class: Task do
    association :user
    name "complete homework"
    priority 1
    due_date { DateTime.now }
  end

  factory :email, class: Task do
    association :user
    name "reply to Zack's email"
    due_date { DateTime.now }
    priority 2
  end
end
