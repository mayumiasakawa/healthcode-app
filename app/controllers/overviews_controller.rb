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
    params.require(:overview).permit(:physicalfinding_measuring_date, :weight, :height, :abdominal_circumference,:blood_urine_test_date, :image).merge(user_id: current_user.id)
  end
end
