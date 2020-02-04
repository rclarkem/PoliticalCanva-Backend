class AddElectionNameToCandidateChosens < ActiveRecord::Migration[6.0]
  def change
    add_column :candidate_chosens, :election_name, :string
  end
end
