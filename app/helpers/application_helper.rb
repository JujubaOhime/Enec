module ApplicationHelper
    def admin_user_logged?
        if !@current_user.nil?
            if @current_user.admin?
                return true
            end
        end
    end
    def brazilian_default_date(date)
        # formatting date: 31 de Outubro de 2007
        date.strftime("%d/%m/%y")
    end
end
