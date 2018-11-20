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
      puts coin.name
      # puts coin.balance
      # puts user.id
      # puts Coin.total_value(Coin.all)
      UserNotifierMailer.notify_admin(user, coin.balance, coin.name, Coin.total_value(Coin.all)).deliver
    end
  end

  def valid_withdrawal
    puts "~~~~~~~~ #{coin.balance}"

    if withdrawal && coin.balance <= 0
      errors.add(:withdrawal, "Invalid withdrawal, no coins left")
    end
  end

end
