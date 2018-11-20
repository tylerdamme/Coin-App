class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :coin
  validate :valid_withdrawal
  validate :low_coin

  def as_json
    {
      id: id,
      coin: coin.as_json,
      created_at: created_at
    }
  end

  def low_coin
    if withdrawal && coin.balance <= 4
      # puts coin.balance
      # puts user.id
      # puts Coin.total_value(Coin.all)
      UserNotifierMailer.low_coin_email(user.id, coin.balance, Coin.total_value(Coin.all)).deliver
    end
  end

  def valid_withdrawal
    puts "~~~~~~~~ #{coin.balance}"

    # if withdrawal && coin.balance <= 4
    #   #email the admin
    # end

    if withdrawal && coin.balance <= 0
      errors.add(:withdrawal, "Invalid withdrawal, no coins left")
    end
  end

end
