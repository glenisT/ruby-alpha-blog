class ApplicationController < ActionController::Base

    #so that these helper methods are available to all controllers
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user #turns current_user method into a boolean
    end

end
