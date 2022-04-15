class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
        @articles = @user.articles
    end

    def new
        @user = User.new
    end

    def edit
    end

    def create
        @user = User.new(user_params)
        if(@user.save)
            session[:user_id] = @user.id  #logs user in automatically once they are signed up
            flash[:notice] = "Welcome to AlphaBlog, #{@user.username}!"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Account updated!"
            redirect_to @user
        else
            render 'edit'
        end
    end

    #!!!user cannot delete itself from its' own controller, due to redirection problems, destroy user has been moved to session_controller
    def destroy
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user
            flash[:alert] = "You can only edit your own profile!"
            redirect_to current_user
        end
    end

end
