class Coin < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions

  def self.total_value(coins)
    sum_of_coins = coins.reduce(0) {|sum, coin| sum + coin.value}
    return sum_of_coins
  end

  def balance
    deposits = transactions.where(type: 'deposit')
    withdrawals = transactions.where(type: 'withdrawal')
    deposits - withdrawals
  end
end
