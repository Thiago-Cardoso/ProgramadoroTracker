FactoryBot.define do
    factory :category do
       description   { FFaker::Lorem.word   }
       user
    end
end 