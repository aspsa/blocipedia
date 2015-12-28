class WelcomeController < ApplicationController
  def index
  end

  def about
  end
  
  def downgrade
    flash[:notice] = "You have elected to downgrade your account to the standard level. Feel free to upgrade your account to a premium level at any time in order to enjoy the full Blocipedia benefits!"
    current_user.account_status?('standard')
  end
end