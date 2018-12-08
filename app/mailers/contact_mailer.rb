class ContactMailer < ApplicationMailer

    def contact_email(form)
        @form = form
        mail to: "enec2019@enec2019.fenec.com.br", subject: @form[:name] + " entrou en contato através do seu site"
      end
end
