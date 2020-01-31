class CreateCandidateChosens < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_chosens do |t|
      t.integer :voter_id
      t.integer :candidate_id
      t.string :candidate_name

      t.timestamps
    end
  end
end
