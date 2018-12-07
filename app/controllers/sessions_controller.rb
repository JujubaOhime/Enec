class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if (user.admin == true)
        redirect_to users_path
      else
        redirect_to user
      end
    else
      flash.now[:danger] = 'Combinação de email e senha inválida.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
