class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :coin
  validate :valid_withdrawal

  def as_json
    {
      id: id,
      coin: coin.as_json,
      created_at: created_at
    }
  end

  def valid_withdrawal
    if withdrawal && coin.balance <= 0
      errors.add(:withdrawal, "Invalid withdrawal, no coins left")
    end
  end

end
