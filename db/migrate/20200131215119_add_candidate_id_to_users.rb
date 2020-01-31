class AddCandidateIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :candidate_id, :integer
  end
end
