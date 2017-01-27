class SlackController < ApplicationController
  def create
    render plain: "Thanks for using a reusable cup! You rock!"
  end
end
