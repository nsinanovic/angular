class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_employer

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_employer
    @current_employer ||= Employer.find(session[:employer_id]) if session[:employer_id]
  end

  def provjera
    if !current_user
      redirect_to root_path
    end
  end




end
