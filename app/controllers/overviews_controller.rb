class OverviewsController < ApplicationController
  def index
  end

  def new
    @overview = Overview.new
  end

  def create
    @overview = Overview.create(overview_params)
    if @overview.valid?
      @overview.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def overview_params
    params.require(:overview).permit(:measuring_date, :weight, :height, :abdominal_circumference).merge(user_id: current_user.id)
  end
end
