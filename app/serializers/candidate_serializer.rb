class CandidateSerializer < ActiveModel::Serializer
  attributes :id,:first_name, :last_name, :age, :ocd_id, :political_party_identification, :street_number, :street_name, :city, :state, :zip_code
  has_many :eligible_voters
end

