class PhysicalfindingsController < ApplicationController
  def index
    render :new
  end

  def new
    @physicalfinding = Physicalfinding.new
  end

  def create
    @physicalfinding = Physicalfinding.create(physicalfinding_params)
    if @physicalfinding.valid?
      @physicalfinding.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def physicalfinding_params
    params.permit(:measuring_date, :weight, :height, :abdominal_circumference)
  end

end
