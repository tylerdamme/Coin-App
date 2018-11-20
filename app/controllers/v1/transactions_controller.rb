class V1::TransactionsController < ApplicationController
before_action :valid_request?

  def create
    transaction_type = params[:type]
    coin = Coin.find(params[:coin_id])

    balance = coin.balance
 
    transaction = Transaction.new(
      user_id: User.get_user(api_key).id,
      coin_id: params["coin_id"],
      withdrawal: transaction_type == 'withdrawal'
      )
    if transaction.save
      render json: transaction.as_json
    else
      render json: {error: transaction.errors}
    end
  end

  def index
    transactions = Transaction.all
    render json: transactions.as_json
  end

  def show
    user = User.find_by(apikey: params[:id])
    puts user
    if user
      transactions = Transaction.where(user_id: user.id)
      render json: transactions.as_json
    else
      render json: {error: "invalid"}
    end
  end
end