class LandingPage::StaticPagesController < ApplicationController
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
        form = {
            name: params[:name],
            email: params[:email],
            message: params[:message]
          }
          ContactMailer.contact_email(form).deliver_later
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
