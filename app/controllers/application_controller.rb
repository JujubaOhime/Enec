class ApplicationController < ActionController::Base
    include SessionsHelper
    include ApplicationHelper
    before_action :current_user
end
