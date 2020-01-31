class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :ocd_id
      t.string :political_party_identification
      t.string :street_number
      t.string :street_name
      t.string :city
      t.string :zip_code
      t.string :state

      t.timestamps
    end
  end
end
