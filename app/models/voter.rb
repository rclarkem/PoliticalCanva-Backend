class Voter < ApplicationRecord
    belongs_to :candidate, optional: true
 
end

#  Voter.create(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, age: Faker::Number.between(from: 18, to: 85), gender: Faker::Gender.binary_type,  ) 