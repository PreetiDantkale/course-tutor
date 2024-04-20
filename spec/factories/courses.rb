FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }
    status { %w[active inactive].sample }
    code { Faker::Lorem.characters(number: 8) }
    start_date { Faker::Date.forward(days: 1) }
    end_date { Faker::Date.forward(days: 30) }
    price { Faker::Commerce.price(range: 50.00..500.00) }
    max_capacity { Faker::Number.between(from: 10, to: 50) }

    transient do
      tutors_count { 2 }
    end

    after(:create) do |course, evaluator|
      create_list(:tutor, evaluator.tutors_count, course: course)
    end
  end
end
