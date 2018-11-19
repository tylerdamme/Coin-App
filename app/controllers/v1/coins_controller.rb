class V1::CoinsController < ApplicationController
  def index
    coins = Coin.all
    render json: coins.as_json
  end

  def create
    coin = Coin.new(
      name: params[:name],
      value: params[:value]
      )
    coin.save
    render json: coin.as_json
  end

  def show
    coin = Coin.find_by(id: params[:id])
    render json: coin.as_json
  end

  def update
    coin = Coin.find_by(id: params[:id])
    coin.name = params[:name] || coin.name
    coin.value = params[:value] || coin.value
    coin.save
    render json: coin.as_json
  end

  def destroy
    coin = Coin.find_by(id: params[:id])
    coin.destroy
    render json: {message: "Coin successfully removed."}
  end
end
