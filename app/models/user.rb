class User < ApplicationRecord
    belongs_to :candidate, optional: true
    has_many :voter_interactions
    has_many :voters, through: :voter_interactions
    
    has_secure_password

    validates :email, presence: true
     validates :email, uniqueness: true
     validates :username, presence: true

 
  def is_admin?
    self.admin == true
  end

    def find_voters
        self.candidate.eligible_voters
    end

   
end
