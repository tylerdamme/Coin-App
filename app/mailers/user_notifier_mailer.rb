class UserNotifierMailer < ApplicationMailer
  default :from => 'any_from_address@email.com'

  # send a low coin email to the user, pass in the user object that   contains the user's email address
  def low_coin_email(user, balance, coin.total_value)
    @user = user
    balance
    coin.total_value

    mail( :to => @user.email,
    :subject => 'The coin machine is running low on a coin!' )
  end
end
