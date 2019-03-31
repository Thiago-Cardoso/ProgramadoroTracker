FactoryBot.define do
    factory :configuration_task do
       duration  { Faker::Number.number(2)  }
       duration_break  { Faker::Number.number(2)  }
       duration_break_long  { Faker::Number.number(2)  }
       long_pause_delay  { Faker::Number.number(2)  }
       have_song  { Faker::Boolean }
       template  { Faker::Number.number(1)  }
       user
    end
end 

