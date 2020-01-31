
User.destroy_all
Candidate.destroy_all
Voter.destroy_all
CandidateChosen.destroy_all



 


(1..50).each do |voter|
address_url = "https://data.cityofnewyork.us/resource/mifw-tguq.json"
address_request = RestClient::Request.execute(
      method: :get,
      url: address_url
    )
      address = JSON.parse(address_request)

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



Voter.all.each do |voter|
    address_of_voter = voter.address_combine(voter.street_number,voter.street_name, voter.city, voter.zip_code, voter.state)
    google_civic_url = "https://www.googleapis.com/civicinfo/v2/representatives"
    google_request = RestClient::Request.execute(
        method: :get,
        url: google_civic_url,
        headers: {
            params: {
                address: address_of_voter,
                includedOffices: true,
                key: ENV["GOOGLE_API_KEY"]
            }
        }
    )
    district = JSON.parse(google_request)
   byebug
end

puts address
end




