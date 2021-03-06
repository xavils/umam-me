class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # to test Devise, let's comment out this line
  # protect_from_forgery with: :exception

  after_filter :set_csrf_cookie

  def set_csrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  protected

  # In Rails 4.2 and above
  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

  # In Rails 4.1 and below
  # def verified_request?
  #   super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  # end
end
