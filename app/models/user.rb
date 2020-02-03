class User < ApplicationRecord
    belongs_to :candidate
    has_secure_password
    validates :email, presence: true

  # This method tells us if the user is an admin or not.
  def is_admin?
    self.admin == true
  end

    def find_voters
        self.candidate.eligible_voters
    end
end
