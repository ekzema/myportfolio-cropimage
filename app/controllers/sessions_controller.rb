class SessionsController < ApplicationController
 skip_before_filter :authorize
  
  def new
  end

 def create
    user = User.find_by_login(params[:login])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to :root, alert: "Неверное имя или пароль!"
    end
  end

    def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "Сеанс завершен"
  end
end
