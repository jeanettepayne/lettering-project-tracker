class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user.authenticate(params[:user][:password])
            session[:username] = @user.email
            redirect_to user_path(@user)
        else
            redirect_to '/login'
        end
    end

    def destroy
        session.delete :username
        redirect_to '/'
    end
end