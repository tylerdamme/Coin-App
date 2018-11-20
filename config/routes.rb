Rails.application.routes.draw do
  namespace :v1 do
    get "/coins" => "coins#index"
    post "/coins" => "coins#create"
    get "/coins/:id" => "coins#show"
    patch "/coins/:id" => "coins#update"
    delete "/coins/:id" => "coins#destroy"

    get "/transactions" => "transactions#index"
    post "/transactions" => "transactions#create"
    get "/transactions/:id" => "transactions#show"
  end
end
