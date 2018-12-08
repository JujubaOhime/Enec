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
    end
    def send_email
        
    end
end
