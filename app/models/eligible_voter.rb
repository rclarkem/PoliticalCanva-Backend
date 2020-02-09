class EligibleVoter < ApplicationRecord
    belongs_to :eligible_voter, class_name: :Voter
    belongs_to :candidate

    validates :eligible_voter_id, uniqueness: {scope: :candidate_id} 


end
