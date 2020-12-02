class OverviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, except: [:index]

  def index
    @overviews = Overview.includes(:user).order("created_at DESC")
    @overview_physicalfinding_measuring = Overview.order(physicalfinding_measuring_date: :desc).first
    @overview_blood_urine_test = Overview.order(blood_urine_test_date: :desc).first
    @overview_medeical_cares = Overview.order(medeical_care_date: :desc).first(3)
    @overview_vaccines = Overview.order(vaccine_date: :desc).first(3)
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

  def physicalfinding
    @overviews = Overview.order(physicalfinding_measuring_date: :desc)
  end

  def bloodurine
    @overviews = Overview.order(blood_urine_test_date: :desc)
  end

  def medeicalcare
    @overviews = Overview.order(medeical_care_date: :desc)
  end

  def vaccine
    @overviews = Overview.order(vaccine_date: :desc)
  end

  private

  def overview_params
    params.require(:overview).permit(:physicalfinding_measuring_date, :weight, :height, :abdominal_circumference,:blood_urine_test_date, :image,:medeical_care_date, :clinic_name, :disease_name, :treatment_medicine, :vaccine_date, :vaccine_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
