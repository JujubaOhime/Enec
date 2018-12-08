module ApplicationHelper
    def admin_user_logged?
        if !@current_user.nil?
            if @current_user.admin?
                return true
            end
        end
    end
end
