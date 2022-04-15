class SessionsController < ApplicationController

    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully!"
            redirect_to user
        else
            flash.now[:alert] = "There was something wrong with your login details!"
            render 'new'
        end
    
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out."
        redirect_to root_path
    end

    def destroy_user
        @user = User.find_by(id: session[:user_id])
        if current_user != @user
            flash[:alert] = "You can only edit your own profile!"
            redirect_to current_user
        end
        @user.destroy
        session[:user_id] = nil
        flash[:notice] = "Account and all associated articles deleted!"
        redirect_to root_path
    end
    
end