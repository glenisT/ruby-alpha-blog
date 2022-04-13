class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(session: params[:session][:email].downcase) #finds user from the session
        if user && user.authenticate(params[:session][:password]) #if user was found in DB
            flash[:notice] = "Logged in successfully!"
            redirect_to user
        else
            render 'new'
            flash.now[:alert] = "There was something wrong with your login details!" #
        end

    end

    def destroy

    end

end
