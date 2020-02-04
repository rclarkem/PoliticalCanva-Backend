class EligibleVotersController < ApplicationController
     def index
          @eligible_voters = EligibleVoter.all
               render json: @eligible_voters
     end


     
end
