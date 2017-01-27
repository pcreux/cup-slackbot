Rails.application.routes.draw do
  root to: "dashboard#index"

  get "data", to: "dashboard#data"
  post "slack_command", to: "slack#create"
end
