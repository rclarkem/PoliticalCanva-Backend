class User < ApplicationRecord
    belongs_to :candidate

    def find_voters
        self.candidate.eligible_voters
    end
end
