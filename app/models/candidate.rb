class Candidate < ApplicationRecord
    has_many :voters



    def eligible_voters
        Voter.find_eligible_voters(self)
    end

end
