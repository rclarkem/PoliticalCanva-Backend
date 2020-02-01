class VotersController < ApplicationController

def index
    @voters = Voter.all
    render json: @voters
end

# def see_eligible_voters
#      # ! This will be the query for the eligble_voters table
#      #  TODO: make custom route
# end

end
