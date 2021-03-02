class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if auth
            @user = User.find_or_create_by(email: auth["info"]["email"]) do |u|
                u.first_name = auth["info"]["name"].split.first
                u.last_name = auth["info"]["name"].split.last
                u.password = SecureRandom.hex(10)
            end
            if @user.persisted?
                session[:user_id] = @user.id
                redirect_to @user
            else
                redirect_to '/login'
            end
        else
            @user = User.find_by(email: params[:user][:email])
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
            redirect_to '/login'
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    private
     
    def auth
      request.env['omniauth.auth']
    end
end