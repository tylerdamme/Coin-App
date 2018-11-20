class ApplicationController < ActionController::API
  def valid_request?
    if User.where(apikey: api_key).empty?
      render json: {message: "unauthorized"}, status: 401
    end
  end

  def api_key
    request.headers['apikey']
  end
end
