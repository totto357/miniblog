class StatusesController < ApplicationController
  def create
    @status = Status.new(status_params)
    if @status.save
      render :create
    else
      render :create_error
    end
  end

  private

  def status_params
    params.require(:status).permit(:text)
  end
end
