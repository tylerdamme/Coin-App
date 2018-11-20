class V1::UsersController < ApplicationController
  def create
    user = User.new(
      email: params[:email],
      apikey: params[:apikey],
      admin: params[:admin]
      )
    if user.save
      render json: {message: "User created"}
    else
      render json: {error: user.errors}, status: :bad_request
    end
  end
end
