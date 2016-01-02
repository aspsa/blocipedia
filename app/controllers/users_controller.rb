class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    current_user.update(role: 'standard') unless current_user.role == 'standard'
    
    if current_user.update(role: 'standard')
      flash[:notice] = "You have elected to downgrade your account to the standard level. Feel free to upgrade your account to a premium level at any time in order to enjoy the full Blocipedia benefits!"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Your account failed to downgrade."
      redirect_to user_path(current_user)
    end
  end
end