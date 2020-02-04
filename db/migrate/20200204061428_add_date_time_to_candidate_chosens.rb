class AddDateTimeToCandidateChosens < ActiveRecord::Migration[6.0]
  def change
    add_column :candidate_chosens, :election_date, :datetime
    add_column :candidate_chosens, :ocd_id, :string
  end
end
