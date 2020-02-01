
User.destroy_all
Candidate.destroy_all
Voter.destroy_all
CandidateChosen.destroy_all


Candidate.create( first_name:"Alexandria",
     last_name:"Ocasio-Cortez",
     age: 32,
     ocd_id: "ocd-division/country:us/state:ny/cd:14",
     political_party_identification: "Democrat",
     street_number: "780",
     street_name: "Third Avenue Suite 2601",
     city: "New York",
     zip_code: '10017',
     state:'New York'
    )
 


(1..30).each do |voter|
address_url = "https://data.cityofnewyork.us/resource/mifw-tguq.json"
address_request = RestClient::Request.execute(
      method: :get,
      url: address_url
    )
      address = JSON.parse(address_request)
# byebug
 Voter.create(first_name: Faker::Name.first_name, 
    last_name:Faker::Name.last_name, 
    age: Faker::Number.between(from: 18, to: 85), 
    gender: Faker::Gender.binary_type,
    ocd_id: nil,
  political_party_identification: Voter.randomize_political_party(),
     street_number: address[voter]["street_number"],
    street_name: address[voter]["street_name"],
    city: address[voter]["city"],
   zip_code: address[voter]["zip_code"],
    state: "New York"
)

end




User.create(first_name: "John", last_name: "Smith", username: "JSmith", password_digest: "123", email: "JS@edu.com", admin: true)




