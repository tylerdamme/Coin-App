class Coin < ApplicationRecord
  def self.total_value(coins)
    p coins
    sum_of_coins = coins.reduce(0) {|sum, coin| sum + coin.value}
    p "return something"
    return sum_of_coins
  end
end
