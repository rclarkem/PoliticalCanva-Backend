class EligibleVoterSerializer < ActiveModel::Serializer
  attributes :id, :eligible_voter_id, :candidate_id, :eligible_voter

  
# def voter_info

#   {first_name: Voter.find(self.object.eligible_voter_id).first_name,
#   last_name: Voter.find(self.object.eligible_voter_id).last_name,
#   age: Voter.find(self.object.eligible_voter_id).age,
#   political_party_identification: Voter.find(self.object.eligible_voter_id).political_party_identification,
#   gender: Voter.find(self.object.eligible_voter_id).gender,
#   street_number: Voter.find(self.object.eligible_voter_id).street_number,
#   street_name: Voter.find(self.object.eligible_voter_id).street_name,
#   city: Voter.find(self.object.eligible_voter_id).city,
#   state: Voter.find(self.object.eligible_voter_id).state,
#   zip_code: Voter.find(self.object.eligible_voter_id).zip_code}
# end


end
