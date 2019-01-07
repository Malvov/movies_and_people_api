module API
    module V2
        class UserTokenController < Knock::AuthTokenController
            # According to https://github.com/nsarno/knock/issues/208, 
            # this gem has some issues with Rails 5.2 and CSRF token authenticity, so you have to do this 
            # or so I figured out
            skip_before_action :verify_authenticity_token
        end
    end
end
