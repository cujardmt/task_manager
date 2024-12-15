class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :categories

    # NOTE: constraints is not working!
    # make sure username is present and unique
    validates :username, presence: true, uniqueness: true
    #make sure email is also present and unique
    validates :email, presence: true, uniqueness: true
    # NOTE: constraints is not working!

    def self.authenticate(username, password)
        user = find_by(username: username)
        # authenticate method is provided by has_secure_password
        return user if user&.authenticate(password) 
        nil
      end
end
