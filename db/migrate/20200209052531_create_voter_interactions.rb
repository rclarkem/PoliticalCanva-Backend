class CreateVoterInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :voter_interactions do |t|
      t.integer :user_id
      t.integer :voter_id
      t.boolean :contact_made
      t.string :contact_not_made_reason
      t.boolean :vote_in_current_election
      t.timestamp :date_of_interaction

      t.timestamps
    end
  end
end
