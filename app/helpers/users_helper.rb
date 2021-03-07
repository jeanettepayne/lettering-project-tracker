module UsersHelper
   
    def user_permitted
        if current_user
            current_user.id == @user.id
        end
    end

end
