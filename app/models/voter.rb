class Voter < ApplicationRecord
    belongs_to :candidate, optional: true

    def address_combine(street_number, street_name, city, zip_code, state )
        "#{self.street_number} #{self.street_name} #{self.city}, #{self.state} #{self.zip_code}"
    end

    def self.randomize_political_party
        party_assoc = ['Democrat', 'Republican', 'Independent', 'Undecided']
        party_assoc.sample
    end
 
end

