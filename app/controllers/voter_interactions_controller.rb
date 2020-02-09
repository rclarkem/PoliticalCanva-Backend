class VoterInteractionsController < ApplicationController
before_action :find_voter_interaction, only: [:show, :edit, :update, :destroy]


def index
    @voter_interactions = VoterInteraction.all 
    render json: @voter_interactions
end


def create
      @voter_interaction.create(interaction_params)
          if @voter_interaction.valid?
            render json: @voter_interaction
        else
            render json: {errors: @voter_interaction.errors.full_messages}, status: 400
        end
end

private

def find_voter_interaction
    @voter_interaction = VoterInteraction.find(params[:id])
end

def interaction_params
    params.require(:voter_interaction).permit(:contact_made, :contact_not_made_reason, :vote_in_current_election)