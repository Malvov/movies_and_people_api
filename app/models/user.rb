class User < ApplicationRecord
    has_secure_password

    validates_length_of       :password, maximum: 72, minimum: 8, allow_nil: true, allow_blank: false
    validates_confirmation_of :password, allow_nil: true, allow_blank: false
  
    before_validation { 
      (self.email = self.email.to_s.downcase)
    }
  
    # Make sure email is present and unique.
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    
end
