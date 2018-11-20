class User < ApplicationRecord
  has_many :coins, through: :transactions
  has_many :transactions

  def self.get_user(api_key)
    find_by(apikey: api_key)
  end
end
