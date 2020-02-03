class VotersController < ApplicationController
    before_action :find_voter, only: [:show, :edit, :update, :destroy]

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
            render json: @voter, status: :created
        else
            render json: {errors: @voter.errors.full_messages}, status: 400
        end
end

def see_eligible_voters
    user = #loggedin user => application controller inherited 
    candidate = Candidate.find(user.candidate_id) 
    eligble_voters = Voter.find_eligible_voters(candidate) 
    @eligble_voters = eligble_voters.each do |voter|
        Voter.find(voter)
    end
    render json: @eligble_voters
end

private

def find_voter
    @voter = Voter.find(params[:id])
end

def voter_params
    params.require(:voter).permit(:first_name, :last_name, :age, :ocd_id, :political_party_identification, :street_number, :street_name, :city, :zip_code, :state, :gender)
end

end
