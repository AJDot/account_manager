class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_holder, :logged_in?

  def current_holder
    @current_holder ||= Holder.find(session[:holder_id]) if session[:holder_id]
  end

  def logged_in?
    !!current_holder
  end
end
