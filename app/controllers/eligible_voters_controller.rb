class EligibleVotersController < ApplicationController
  before_action :find_eligible_voter, only: [:show, :edit, :update, :destroy] 
  before_action :require_login
     
     def my_eligible_voters
          user = logged_in_user_decoded
          my_voters = User.find(user).candidate.id
          @eligible_voters = EligibleVoter.where(candidate_id: my_voters)
          render json: @eligible_voters
     end
   
     def show
          render json: @eligible_voter
     end


     private

     def find_eligible_voter
          @eligible_voter = EligibleVoter.find(params[:id])
     end
end
