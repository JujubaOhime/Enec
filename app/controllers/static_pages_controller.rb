class StaticPagesController < ApplicationController
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
    end
end
