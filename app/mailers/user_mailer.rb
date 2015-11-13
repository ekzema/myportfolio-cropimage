class UserMailer < ApplicationMailer
	default :from => "me@mydomain.com"

	def registration(user)
    @user = user
    mail(:to => @user.email, :subject => "Registration")
	end
end
