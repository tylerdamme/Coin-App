class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :coin

  def as_json
    {
      id: id,
      coin: coin.as_json,
      created_at: created_at
    }
  end

end
