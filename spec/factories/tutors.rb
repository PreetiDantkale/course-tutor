FactoryBot.define do
  factory :tutor do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    experience { "#{Faker::Number.between(from: 1, to: 10)} years" }
    specialization { Faker::Educator.subject }
    status { %w[active inactive].sample }
  end
end
