class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
    

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  	helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '123.45.67.89'
    else
      request.remote_ip
    end
  end
end
