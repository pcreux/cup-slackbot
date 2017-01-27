class SlackController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    render plain: HandleCupCommand.call(params.to_unsafe_hash)
  end
end
