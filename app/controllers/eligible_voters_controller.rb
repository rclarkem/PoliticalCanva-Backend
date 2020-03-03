class EligibleVotersController < ApplicationController
  before_action :find_eligible_voter, only: [:show, :edit, :update, :destroy] 
  before_action :require_login
     

     def index
          @eligible_voters = EligibleVoter.all 
          render json: @eligible_voters, include: '**'
     end

     

     def my_eligible_voters
          user = logged_in_user_decoded
          my_voters = User.find(user).candidate.id
          @eligible_voters = EligibleVoter.where(candidate_id: my_voters)
          render json:  @eligible_voters,  include: '**'
     end
   
     def show
          render json: @eligible_voter,  include: '**'
     end

     def create
          @eligible_voter.create(eligible_voter_params)
          if @eligible_voter.valid?
            render json: @eligible_voter,  include: '**'
        else
            render json: {errors: @eligible_voter.errors.full_messages}, status: 400
        end
     end

     def destroy
          eligible_voter = EligibleVoter.find(params[:id])
          eligible_voter.destroy
          render json: eligible_voter
     end


     private

     def eligible_voter_params
          params.require(:eligible_voter).permit(:eligible_voter_id, :candidate_id)
     end

     def find_eligible_voter
          @eligible_voter = EligibleVoter.find(params[:id])
     end
end
