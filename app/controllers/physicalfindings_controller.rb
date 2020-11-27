class PhysicalfindingsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to new_physicalfinding_path
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
      render :new
    end
  end

  private

  def physicalfinding_params
    params.require(:physicalfinding).permit(:measuring_date, :weight, :height, :abdominal_circumference)
  end

end
