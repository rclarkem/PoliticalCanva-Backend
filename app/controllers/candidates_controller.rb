class CandidatesController < ApplicationController
before_action :find_candidate, only: [:show, :edit, :update, :destroy]

def index
    @candidates = Candidate.all
    render json: @candidates
end

def show
    render json: @candidate
end

private

def find_candidate
    @candidate = Candidate.find(params[:id])
end

end
