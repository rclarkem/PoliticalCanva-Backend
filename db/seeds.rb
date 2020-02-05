
User.destroy_all
Candidate.destroy_all
Voter.destroy_all
CandidateChosen.destroy_all

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
  political_party_identification: Voter.randomize_political_party(),
     street_number: address[voter]["street_number"],
    street_name: address[voter]["street_name"],
    city: address[voter]["city"],
   zip_code: address[voter]["zip_code"],
    state: "New York"
)

end

# Voter.create(first_name: "Nancy", last_name: "Chen", age: 27, gender: "female", political_party_identification: "Democrat", street_number: "925", street_name: "Astor Avenue", city: "Bronx", zip_code: "104691", state: "New York")

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
#  Candidate.create( first_name:"Kristen", last_name:"Gillibrand", age: 32 ,ocd_id: "ocd-division/country:us/state:ny",political_party_identification: "Democrat",street_number: "780",street_name: "Third Avenue Suite 2601",city: "New York",zip_code: '10017', state:'New York')

User.create(first_name: "John", last_name: "Smith", username: "JSmith", password: "123", email: "JS@edu.com", admin: true)
# User.create(first_name: "Jack", last_name: "Thomson", username: "JThom", password: "123", email: "JT@edu.com", admin: false)
# User.create(first_name: "John", last_name: "Smith", username: "JSmith", password: "123", email: "JS@edu.com", admin: true)








