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

      email = SendGrid::Mail.new do |m|
        m.to      = 'matheus.perrut@injunior.com.br'
        m.from    = 'fenec@fenec.com.br'
        m.subject = 'Sending with SendGrid is Fun'
        m.html    = 'and easy to do anywhere, even with Ruby'
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
