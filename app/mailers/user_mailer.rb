class UserMailer < ActionMailer::Base
  default from: "vvenkatesh.nyros@gmail.com"

  def welcome_mail(user,subject,src)
  	@user = user
  	@subject=subject
  	@src=src 
  	arr = src.split("/")
  	attachments[arr[arr.length-1]] = File.read("#{Rails.root}/public/"+@src)
    mail :to => @user , :subject => @subject
  end


  def pass_mail(user,pass)
  	@user = user
  	@pass= pass
  	mail :to => @user , :subject => "password recovery"
  end
end
