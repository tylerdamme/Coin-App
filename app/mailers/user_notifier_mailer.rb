class UserNotifierMailer < ApplicationMailer
  default :from => 'any_from_address@email.com'

  # send a low coin email to the user, pass in the user object that   contains the user's email address
  def notify_admin(user, coin_balance,  coin_name, total_value)
    @user = user
    @coin_bal = coin_balance
    @total = total_value
    @name = coin_name

    mail( :to => @user.email,
    :subject => 'A coin is running low!' )
  end
end