# frozen_string_literal: true

class SessionController < ApplicationController
  before_action :require_login!

  private

  def require_login!
    if session[:current_user_id].present?
      @current_user = User.find_by(id: session[:current_user_id])
      unless @current_user
        # User not found, clear the session
        session.delete(:current_user_id)
      end
    end

    unless @current_user
      session[:destination_after_login] = request.env['REQUEST_URI']
      redirect_to login_url
    end
  end
end