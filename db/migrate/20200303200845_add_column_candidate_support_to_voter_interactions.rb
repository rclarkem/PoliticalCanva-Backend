class AddColumnCandidateSupportToVoterInteractions < ActiveRecord::Migration[6.0]
  def change
    add_column :voter_interactions, :candidate_support, :boolean
  end
end
