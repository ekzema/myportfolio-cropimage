class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery with: :exception

  protected

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to :root, notice: "Пожалуйста, пройдите авторизацию"
      end
    end

end
