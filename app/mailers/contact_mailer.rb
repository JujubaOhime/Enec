class ContactMailer < ApplicationMailer

    def contact_email(form)
        @form = form
        mail to: "matheus.perrut2302@gmail.com", subject: @form[:name] + " entrou en contato através do seu site"
    end
end
