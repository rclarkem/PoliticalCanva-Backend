class ChangeDateOfInteractionToBeAStringInVoterInteractions < ActiveRecord::Migration[6.0]
  def change
   change_column :voter_interactions, :date_of_interaction, :string
  end
end
