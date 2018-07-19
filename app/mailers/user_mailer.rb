class UserMailer < ApplicationMailer

  default from: "no-reply@jungle.com"

  def welcome_email(user: user)
    @url  = 'http://localhost:3000'
    @user = user
    mail(to: @user.email, subject: 'Welcome to the Jungle!')
  end

  def order_email(user:user, order: order)
    @user = user
    @order = order
    mail(to: @order.email, subject: 'Thanks to buy with us!')
  end

end
