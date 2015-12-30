class UsersController < ApplicationController
  def edit
    update
  end
  
  def update
    flash[:notice] = "You have elected to downgrade your account to the standard level. Feel free to upgrade your account to a premium level at any time in order to enjoy the full Blocipedia benefits!"
    if current_user.update(user_params)
      self.account_status?('standard')
    end
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end
end