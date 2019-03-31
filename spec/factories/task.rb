FactoryBot.define do
    factory :task do
       description   { FFaker::Lorem.word   }
       status  { Faker::Boolean }
       is_current  { Faker::Boolean }
       user
       category
    end
end 