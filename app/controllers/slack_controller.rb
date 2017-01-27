class SlackController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    render plain: "Thanks for using a reusable cup! You rock!"
  end
end
