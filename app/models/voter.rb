class Voter < ApplicationRecord
    belongs_to :candidate, optional: true

    def address_combine
        "#{self.street_number} #{self.street_name} #{self.city}, #{self.state} #{self.zip_code}"
    end

    def self.randomize_political_party
        party_assoc = ['Democrat', 'Republican', 'Independent', 'Undecided']
        party_assoc.sample
    end

    def self.find_eligible_voters(candidate)  
        eligible_voters = []
        Voter.all.each do |voter|
            address_of_voter = voter.address_combine
            google_civic_url = "https://www.googleapis.com/civicinfo/v2/representatives"
            google_request = RestClient::Request.execute(
                method: :get,
                url: google_civic_url,
                headers: {
                    params: {
                        address: address_of_voter,
                        includedOffices: true,
                        key: 'AIzaSyB0aINBM-6ruLJ1fxuzEvn3EuaoBTH0Veo'
                    }
                }
            )
            district = JSON.parse(google_request)

            if district["divisions"].include?(candidate.ocd_id)
                eligible_voters << voter
            end
            # district["divisions"].keys.each do |ocd_id|
            #     if ind.find {|i| i === candidate.ocd_id}
            #         # byebug
            #         eligible_voters << voter
            #         # puts "#{voter} THIS PERSON IS NOT NIL"
            #     end
            # end
        end

        eligible_voters

    end
 
end

