Rails.application.routes.draw do
  root to: "dashboard#index"

  post "slack_command", to: "slack#create"
end
