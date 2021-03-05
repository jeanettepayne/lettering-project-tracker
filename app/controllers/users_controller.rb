class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show, :new, :create]

    def show
        @user = User.find_by(id: params[:id])
    end

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            render 'show'
        else
            render 'users/new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
