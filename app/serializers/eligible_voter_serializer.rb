class EligibleVoterSerializer < ActiveModel::Serializer
  attributes :id, :eligible_voter_id, :candidate_id, :eligible_voter
  has_many :voter_interactions


  def voter_interactions    
    self.object.eligible_voter.voter_interactions
  end


end
