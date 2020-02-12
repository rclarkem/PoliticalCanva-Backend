class Candidate < ApplicationRecord
    # should have named this better. Voters may chose our candidate or another during canvassing.
    has_many :candidate_chosens
    has_many :voters, through: :candidate_chosens

    has_many :users

    has_many :eligible_voters
    has_many :voters_who_can_vote_for_me, through: :eligible_voters, source: :eligible_voter

    after_create :create_eligible_voters


  def address_combine
        "#{self.street_number} #{self.street_name} #{self.city}, #{self.state} #{self.zip_code}"
    end

    private


    
    def create_eligible_voters
        array_of_ids = Voter.find_eligible_voters(self)
  
        array_of_ids.each do |voter_id|
            EligibleVoter.create(eligible_voter_id: voter_id, candidate_id: self.id)
        end
    end

end
