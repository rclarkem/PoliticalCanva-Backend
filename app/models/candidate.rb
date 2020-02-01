class Candidate < ApplicationRecord
    # should have named this better. Voters may chose our candidate or another during canvassing.
    has_many :candidate_chosens
    has_many :voters, through: :candidate_chosens

    has_many :eligible_voters
    has_many :voters, through: :eligible_voters




    def eligible_voters
        Voter.find_eligible_voters(self)
    end

end
