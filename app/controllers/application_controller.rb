class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_search
  protect_from_forgery with: :exception


  private

  def set_search
    @q = Space.ransack(params[:q])
  end
end
