class EligibleVoterSerializer < ActiveModel::Serializer
  attributes :id, :eligible_voter_id, :candidate_id, :eligible_voter, :voter_interactions


  def voter_interactions    
    # byebug
    self.object.eligible_voter.voter_interactions
  end


end
