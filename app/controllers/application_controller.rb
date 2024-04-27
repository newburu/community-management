class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :set_current_user

  def set_current_user
    User.current_user = current_user if current_user
  end

  private

  def user_not_authorized
    render file: Rails.root.join('public/403.html'), status: :forbidden
  end

end
