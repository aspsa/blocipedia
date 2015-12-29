class UsersController < ApplicationController
  def update
    self.update(role: 'premium')
  end

  private
  
=begin  
    def account_status?(stat)
      if upgrade
        self.update(role: 'premium')
      else
        self.update(role: 'standard')
      end
    end
  
    def downgrade
      flash[:notice] = "You have elected to downgrade your account to the standard level. Feel free to upgrade your account to a premium level at any time in order to enjoy the full Blocipedia benefits!  "
      current_user.account_status?('standard')
    end
=end  

    def user_params
      params.require(:user).permit(:email)
    end
end