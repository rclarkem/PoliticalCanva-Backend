class Voter < ApplicationRecord
    belongs_to :candidate, optional: true
    
    has_many :voter_interactions
    has_many :users, through: :voter_interactions, dependent: :destroy
    # The candidates they are eligible to vote for:
    has_many :potential_candidates, foreign_key: :eligible_voter_id, class_name: :EligibleVoter, dependent: :destroy
    

    # The candidate they have chosen to vote for:
    #has_many :endorsed_candidates, ...class_name :CandidateChosen 



    # after_create :find_if_eligible

    # used for api query and other features to input address as a string. 
    def address_combine
        "#{self.street_number} #{self.street_name} #{self.city}, #{self.state} #{self.zip_code}"
    end

    # method for seed file to randomize party
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
                        key: ENV["GOOGLE_API_KEY"]
                    }
                }
            )
            district = JSON.parse(google_request)
            if district["divisions"].include?(candidate.ocd_id)
                eligible_voters << voter.id
            end
        end
        eligible_voters
    end



    

    def self.candidate_in_district(voter)  
        candidate_id = []
        Candidate.all.each do |candidate|
            address_of_voter = voter.address_combine
            google_civic_url = "https://www.googleapis.com/civicinfo/v2/representatives"
            google_request = RestClient::Request.execute(
                method: :get,
                url: google_civic_url,
                headers: {
                    params: {
                        address: address_of_voter,
                        includedOffices: true,
                        key: ENV["GOOGLE_API_KEY"]
                    }
                }
            )
            district = JSON.parse(google_request)
            if district["divisions"].include?(candidate.ocd_id)
                candidate_id << candidate.id
            end
        end
        # byebug
        candidate_id
    end
 


    # end of class
end

