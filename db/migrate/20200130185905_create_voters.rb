class CreateVoters < ActiveRecord::Migration[6.0]
  def change
    create_table :voters do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :political_party_identification
      t.integer :candidate_id
      # t.time :last_election_voted_date
      t.string :street_number
      t.string :street_name
      t.string :city
      t.string :zip_code
      t.string :state

      t.timestamps
    end
  end
end
