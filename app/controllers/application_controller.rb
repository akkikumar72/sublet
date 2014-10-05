class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_search
  before_action :set_last_five_requested_spaces
  protect_from_forgery with: :exception

  def verify_captcha_values
    if verify_recaptcha
      true
    else
      flash[:recaptcha_error] = "Invalid captcha"
      false
    end
  end

  private

  def set_search
    @q = Space.ransack(params[:q])
  end

  def set_last_five_requested_spaces
    @requested_spaces = SpaceRequest.last(5)
  end


end
