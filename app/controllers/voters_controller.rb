class VotersController < ApplicationController

def index
    @voters = Voter.where.not(ocd_id: nil)
    render json: @voters
end

end
