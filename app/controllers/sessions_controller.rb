class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/login'
        end
    end

    def auth_create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
          end
          binding.pry
       
          session[:user_id] = @user.id
       
          render '/'
    end

    def google_auth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        user = User.from_omniauth(access_token)
        log_in(user)
        # Access_token is used to authenticate request made from the rails application to the google server
        user.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        user.google_refresh_token = refresh_token if refresh_token.present?
        user.save
        redirect_to root_path
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