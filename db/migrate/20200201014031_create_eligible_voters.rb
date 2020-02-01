class CreateEligibleVoters < ActiveRecord::Migration[6.0]
  def change
    create_table :eligible_voters do |t|
      t.integer :candidate_id
      t.integer :voter_id

      t.timestamps
    end
  end
end
