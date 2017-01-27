class DashboardController < ApplicationController
  def index
  end

  def data
    render json: GetDashboardData.call
  end
end
