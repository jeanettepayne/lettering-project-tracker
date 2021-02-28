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
       
          session[:user_id] = @user.id
       
          render '/'
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