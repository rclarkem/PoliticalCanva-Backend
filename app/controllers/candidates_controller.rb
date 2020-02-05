class CandidatesController < ApplicationController
before_action :find_candidate, only: [:show, :edit, :update, :destroy]
before_action :require_login

def index
    @candidates = Candidate.all
    render json: @candidates
end

    def show
        render json: @candidate
    end

    def create
        if User.find(logged_in_user_decoded).is_admin?
            @candidate = Candidate.create(candidate_params)
                if @candidate.valid?
                    render json: @candidate, status: :created
                else
                    render json: {errors: @candidate.errors.full_messages}, status: 400
                end
        end
    end

private

    def find_candidate
        @candidate = Candidate.find(params[:id])
    end

    def candidate_params
        params.require(:candidate).permit(:first_name, :last_name, :age, :ocd_id, :political_party_identification, :street_number, :street_name, :city, :zip_code, :state)
    end

end
