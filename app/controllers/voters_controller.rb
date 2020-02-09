class VotersController < ApplicationController
    before_action :find_voter, only: [:show, :edit, :update, :destroy]
    # before_action :require_login
    # TODO: Add another migration of column for phone_numbers:string into voters table 

def index
    @voters = Voter.all
    render json: @voters
end

def show
    render json: @voter
end

def create
     @voter = Voter.create(voter_params)
        if @voter.valid?
            candidate_ids = Voter.candidate_in_district(@voter)
             candidate_ids.each do |candidate_id|
                    EligibleVoter.create(eligible_voter_id: @voter.id, candidate_id: candidate_id)
                end
            render json: @voter, status: :created
        else
            render json: {errors: @voter.errors.full_messages}, status: 400
        end
end

private

def find_voter
    @voter = Voter.find(params[:id])
end

def voter_params
    params.require(:voter).permit(:first_name, :last_name, :age, :political_party_identification, :street_number, :street_name, :city, :zip_code, :state, :gender)
end

end
