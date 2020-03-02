class VoterInteractionSerializer < ActiveModel::Serializer
  attributes :id, :voter_id, :candidate_id, :user_id, :contact_made, :contact_not_made_reason, :vote_in_current_election, :date_of_interaction, :user

end
