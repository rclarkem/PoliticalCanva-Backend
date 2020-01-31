
User.destroy_all
Candidate.destroy_all
Voter.destroy_all


def randomize_political_party
    party_assoc = ['Democrat', 'Republican', 'Independent']
    party_assoc.sample
end


(1..100).each do |voter|
request_url = "https://data.cityofnewyork.us/resource/mifw-tguq.json"
request = RestClient::Request.execute(
      method: :get,
      url: request_url
    )
      addresses = JSON.parse(request)

 Voter.create(first_name: Faker::Name.first_name, 
    last_name:Faker::Name.last_name, 
    age: Faker::Number.between(from: 18, to: 85), 
    gender: Faker::Gender.binary_type,
  political_party_identification: randomize_political_party(),
     street_number: addresses[voter]["street_number"],
    street_name: addresses[voter]["street_name"],
    city: addresses[voter]["city"],
   zip_code: addresses[voter]["zip_code"],
    state: "New York"
)

puts Voter.id
end




# byebug