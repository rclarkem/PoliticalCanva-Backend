class EligibleVoter < ApplicationRecord
    belongs_to :eligible_voter, class_name: :Voter
    belongs_to :candidate
end
