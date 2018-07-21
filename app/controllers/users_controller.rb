class UsersController < ApplicationController

  def new
  end
  
  def create

    email_exist = User.where(:email => user_params['email']).exists?
    password = user_params['password']
    password_check = user_params['password_confirmation']

    if password != password_check
      redirect_to '/signup', flash: { danger: 'Password and password confirmation must match' }
    else
      if email_exist
        redirect_to '/signup', flash: { danger: 'Email already exists' }
      else
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          UserMailer.welcome_email(user:user).deliver_now
          redirect_to '/'
        else
          redirect_to '/signup'
        end
      end
    end

  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
