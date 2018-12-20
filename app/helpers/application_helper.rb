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
    def admin_only
        if logged_in?
            if !admin_user_logged?
                redirect_to @current_user
            end
        end
    end

    def payment_link(user)
        if user.payment.present?
            return user.payment
        else
            return new_payment_path
        end
    end

    def monetary_string_to_decimal(string)
        string = string.gsub('.', '')
        string = string.gsub(',', '.')
        string = string.remove('R$')
        BigDecimal.new(string)
    end
end
