class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :admin, :candidate_id
  attribute :candidate?, if: :candidate?
  has_many :voter_interactions

def candidate?
   if object.candidate
    object.candidate
   end
end

#   def candidate_info
#     {first_name: Candidate.find(self.object.candidate.id).first_name,
#     last_name: Candidate.find(self.object.candidate.id).last_name,
#     age: Candidate.find(self.object.candidate.id).age,
#     political_party_identification: Voter.find(self.object.candidate.id).political_party_identification,
#     street_number: Candidate.find(self.object.candidate.id).street_number,
#     street_name: Candidate.find(self.object.candidate.id).street_name,
#     city: Candidate.find(self.object.candidate.id).city,
#     state: Candidate.find(self.object.candidate.id).state,
#     zip_code: Candidate.find(self.object.candidate.id).zip_code}
# end




end


