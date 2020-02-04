class EligibleVotersController < ApplicationController
  before_action :find_eligible_voter, only: [:show, :edit, :update, :destroy] 
  before_action :require_login
     
     def index
          @eligible_voters = EligibleVoter.all
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
