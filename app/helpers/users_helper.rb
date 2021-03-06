module UsersHelper
   
    def user_permitted
        current_user.id == @user.id
    end

end
