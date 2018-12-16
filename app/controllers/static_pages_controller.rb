class StaticPagesController < ApplicationController

    include StaticPagesHelper
    include ActionView::Helpers::NumberHelper

    def landing_page
        @showcase = Showcase.all.first
        @the_event = TheEvent.all.first
        @airfare = Airfare.all.first
        @the_speakers = TheSpeaker.all.first
        @event_notices = EventNotice.all.first
        @video = MerchandisingVideo.all.first
        @event_realizers = EventRealizer.all
        @sponsors_and_supporters = SponsorsAndSupporter.all
        @event_realizers_title = EventRealizersTitle.all.first.title
        @sponsor_and_supporters_title = SponsorsAndSupportersTitle.all.first.title
    end
    
    def send_email
        form = {
            name: params[:name],
            email: params[:email],
            message: params[:message]
          }
          ContactMailer.contact_email(form).deliver_later
    end
    
    def sections_edit
        @showcase = Showcase.all.first
        @the_event = TheEvent.all.first
        @airfare = Airfare.all.first
        @the_speakers = TheSpeaker.all.first
        @event_notices = EventNotice.all.first
        @video = MerchandisingVideo.all.first
    end
    
    def formulario_pagamento
        
    end
    
    def formulario_pagamento_enviar
        info = params.require(:subscription).permit(:name, :cpf, :package_id, :email, :telephone, :pagamento, :parcelas)
        package = Package.find(info[:package_id])
        
        payment = Payment.new(
            value: package.value,
            payment_option: info[:pagamento],
            parceling_option: info[:parcelas],
            user: current_user,
            package: package
        )

        if payment.save
            payment.generate_parcels(info[:parcelas])
            current_user.update(package: package)
            
            info[:id] = current_user.id
            info[:package] = package
            PaymentMailer.notify_admin_about_payment(info).deliver_later
            PaymentMailer.notify_user_about_payment(current_user).deliver_later

            redirect_to payment
        else
            flash.notice = payment.errors
            redirect_to form_pagamento_path
        end
    end
    
    def get_parcelas
        @result = parcelas(params[:package_id], params[:pagamento])
        
        render json: @result
    end
end
