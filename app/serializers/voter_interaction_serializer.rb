class VoterInteractionSerializer < ActiveModel::Serializer
  attributes :id, :canvasser_id, :voter_id, :contact_made, :contact_not_made_reason, :vote_in_current_election, :date_of_interaction
end
