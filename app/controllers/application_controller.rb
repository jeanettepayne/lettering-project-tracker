class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?

    def current_user
        if session[:username]
            @current_user ||= User.find_by(email: session[:username])
        end
    end

    def logged_in?
        !current_user.nil?
    end
    
end
