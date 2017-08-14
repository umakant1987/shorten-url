class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :check_json?

  protected

  def check_json?
  	request.format.json?
  end
end