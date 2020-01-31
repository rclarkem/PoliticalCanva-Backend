class VotersController < ApplicationController

def index
    @voters = Voter.all
    render json: @voters
end

end
