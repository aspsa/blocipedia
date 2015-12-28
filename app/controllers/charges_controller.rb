class ChargesController < ApplicationController
  def create
    # Creates a Stripe Customer object for associating with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    
    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id,  # Note -- this is NOT the user_id in your app
      amount: Amount.default,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )
    
    flash[:notice] = "Thank you for the payment #{current_user.email}! Your Blocipedia account has been upgraded to the Premium level."
    current_user.account_status?('premium')
    redirect_to root_path
    
    # Strip will send back CardErrors with friendly messages when something goes wrong. The 'rescue block' catches and displays those errors.
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  
  def new
    @stripe_btn_data = {
      key: "#{Rails.configuration.stripe[:publishable_key] }",
      description: "Buy Premium Membership",
      amount: Amount.default
    }
  end
end