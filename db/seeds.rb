
User.destroy_all
Candidate.destroy_all
Voter.destroy_all
CandidateChosen.destroy_all


Candidate.create( first_name:"Alexandria",
     last_name:"Ocasio-Cortez",
     age: 42,
     ocd_id: "ocd-division/country:us/state:ny/cd:14",
     political_party_identification: "Democrat",
     street_number: "74-09 ",
     street_name: "37th Avenue Suite 305",
     city: "Jackson Heights",
     zip_code: '11372',
     state:'New York'
    )
 


(1..5).each do |voter|
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
    district["divisions"].each do |ind|
        if ind.find {|i| i === Candidate.first.ocd_id}
            voter.update(ocd_id: ind[0])
        end
    end
end

puts address
end




