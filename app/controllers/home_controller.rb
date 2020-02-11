class HomeController < ApplicationController
  def index
    @status = Status.new
    @statuses = Status.order(created_at: :desc).page(params[:page]).per(20)
  end
end
