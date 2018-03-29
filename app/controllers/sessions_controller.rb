class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
    redirect_to tests_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Wrong email or password was entered'
      render :new
    end
  end

  def close
    # session.delete(:user_id)
    session.destroy
    redirect_to root_path
  end

end
