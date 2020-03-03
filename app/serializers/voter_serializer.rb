class VoterSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :age, :gender, :political_party_identification, :street_number, :street_name, :city, :state, :zip_code
  has_many :voter_interactions


end
