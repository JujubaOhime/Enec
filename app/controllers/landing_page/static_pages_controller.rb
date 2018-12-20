class LandingPage::StaticPagesController < ApplicationController
    require 'sendgrid-ruby'
    
    before_action only: [:sections_edit] do
        needs_to_be_admin("Você não tem permissão para isso!")
    end

    def landing_page
        @showcase =LandingPage::Showcase.all.first
        @the_event =LandingPage::TheEvent.all.first
        @airfare =LandingPage::Airfare.all.first
        @the_speakers =LandingPage::TheSpeaker.all.first
        @event_notices =LandingPage::EventNotice.all.first
        @video =LandingPage::MerchandisingVideo.all.first
        @event_realizers = LandingPage::EventRealizer.all
        @sponsors_and_supporters =LandingPage::SponsorsAndSupporter.all
        @event_realizers_title = LandingPage::EventRealizersTitle.all.first.title
        @sponsor_and_supporters_title =LandingPage::SponsorsAndSupportersTitle.all.first.title
    end
    
    def send_email
      sendgrid = SendGrid::Client.new do |c|
        c.api_key = ENV["sendgrid_api_key"]
      end
      
      form = {
            name: params[:name],
            email: params[:email],
            message: params[:message]
      }

      email = SendGrid::Mail.new do |m|
        m.to      = 'inscricaoenec@fenec.com.br'
        m.from    = form[:email]
        m.subject = "#{form[:name]} entrou em contato através do seu site"
        m.html    = 
        "<p>Olá,</p>
        
         <p>#{form[:name]} lhe enviou uma mensagem:</p>
        
         <p>#{form[:message]}</p>
        
         <p>Email: #{form[:email]}</p>"
        
        m.text    = 
         "Olá,
        
          #{form[:name]} lhe enviou uma mensagem:
        
          #{form[:message]}
        
          Email: #{form[:email]}"
      end
      
      sendgrid.send(email)
    end
    
    def sections_edit
        @showcase =LandingPage::Showcase.all.first
        @the_event =LandingPage::TheEvent.all.first
        @airfare =LandingPage::Airfare.all.first
        @the_speakers =LandingPage::TheSpeaker.all.first
        @event_notices =LandingPage::EventNotice.all.first
        @video =LandingPage::MerchandisingVideo.all.first
    end
end
