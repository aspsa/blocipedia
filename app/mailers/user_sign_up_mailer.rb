class UserSignUpMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_sign_up_mailer.user_sign_up_notification.subject
  #
  def user_sign_up_notification
    @greeting = "Greetings from 'aspsa-blocipedia'"

    mail to: "aspsamailgun@gmail.com"
  end
end
