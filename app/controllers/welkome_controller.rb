class WelkomeController < ApplicationController
	skip_before_filter :authorize
	 before_action :user_session
	
  def index  
  end

  def contact 
  end

 private

  def user_session
    @user = session[:user_id]
  	if session[:user_id]
  		@user_ava = User.find(@user)
  	end
  end

end


