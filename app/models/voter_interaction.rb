class VoterInteraction < ApplicationRecord
    belongs_to :user
    belongs_to :voter
end
