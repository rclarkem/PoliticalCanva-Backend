class AddCandidateIdToVoterInteractions < ActiveRecord::Migration[6.0]
  def change
    add_column :voter_interactions, :candidate_id, :integer
  end
end
