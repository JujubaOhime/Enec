class PaymentMailer < ApplicationMailer
    def notify_admin_about_payment(user_info)
        @user_info = user_info
        @user = User.find(user_info[:id])
        mail to: "enec2019@enec2019.fenec.com.br", subject: @user.name + " criou um pagamento!"
    end

    def notify_user_about_payment(user)
        @user = user
        mail to: @user.email, subject: "Solicitação de Pagamento registrada com sucesso!"
    end
end
