class EligibleVoterSerializer < ActiveModel::Serializer
  attributes :id, :eligible_voter_id, :voter_info
  
def voter_info
  {first_name: Voter.find(self.object.id).first_name,
  last_name: Voter.find(self.object.id).last_name,
  age: Voter.find(self.object.id).age,
  political_party_identification: Voter.find(self.object.id).political_party_identification,
  gender: Voter.find(self.object.id).gender,
  street_number: Voter.find(self.object.id).street_number,
  street_name: Voter.find(self.object.id).street_name,
  city: Voter.find(self.object.id).city,
  state: Voter.find(self.object.id).state,
  zip_code: Voter.find(self.object.id).zip_code}
end


end
