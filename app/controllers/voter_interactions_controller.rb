class VoterInteractionsController < ApplicationController
before_action :find_voter_interaction, only: [:show, :edit, :update, :destroy]
before_action :require_login

def index
    voter_interactions = VoterInteraction.all 
    render json: voter_interactions
end

def my_voter_interactions
          user = logged_in_user_decoded
          my_voters = User.find(user).candidate.id
          @interactions = VoterInteraction.where(candidate_id: my_voters)
          render json: @interactions
end

def create
    user_id = User.find(logged_in_user_decoded).id
    voter_interaction = VoterInteraction.create(user_id: user_id, date_of_interaction: params[:date_of_interaction], contact_made: params[:contact_made], contact_not_made_reason: params[:contact_not_made_reason], vote_in_current_election: params[:vote_in_current_election], voter_id: params[:voter_id], candidate_id: params[:candidate_id] )
    #   byebug
          if voter_interaction.valid?
            render json: voter_interaction
        else
            render json: {errors: voter_interaction.errors.full_messages}, status: 400
        end
end

private

def find_voter_interaction
    @voter_interaction = VoterInteraction.find(params[:id])
end

def interaction_params
    params.require(:voter_interaction).permit(:contact_made, :contact_not_made_reason, :vote_in_current_election, :voter_id, :candidate_id)
end

end