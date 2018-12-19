class ContactMailer < ApplicationMailer

    def contact_email(form)
        @form = form
        mail to: "matheus.perrut@injunior.com.br", subject: @form[:name] + " entrou en contato através do seu site"
      end
end
