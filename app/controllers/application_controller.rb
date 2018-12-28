class ApplicationController < ActionController::API
    #protect_from_forgery

    include Knock::Authenticable
end
