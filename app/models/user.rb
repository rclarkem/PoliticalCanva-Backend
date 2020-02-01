class User < ApplicationRecord
    belongs_to :candidate

    has_secure_password

    def find_voters
        self.candidate.eligible_voters
    end
end
