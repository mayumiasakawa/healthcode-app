class OverviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :physicalfinding, :bloodurine, :medicalcare, :vaccine]
  before_action :move_to_index, except: [:index]
  before_action :set_overview, only: [:edit, :update, :destroy]
  before_action :set_chart, only: [:index, :physicalfinding]
  before_action :overview_physicalfinding_measuring, only: [:index, :physicalfinding]
  before_action :overview_blood_urine_test, only: [:index, :bloodurine]
  before_action :overview_medical_care, only: [:index, :medicalcare]
  before_action :overview_vaccines, only: [:index, :vaccine]
  

  def index
  end

  def new
    @overview = Overview.new
  end

  def new_physicalfinding
    @overview = Overview.new
  end

  def new_bloodurine
    @overview = Overview.new
  end

  def create
    @overview = Overview.create(overview_params)
    if @overview.valid?
      @overview.save
      redirect_to root_path
    else
      render new_overview_path
    end
  end

  def edit
    unless current_user == @overview.user
      redirect_to root_path
    end
  end

  def update
    if @overview.update(overview_params)
      @overview.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @overview.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def physicalfinding
  end

  def bloodurine
  end

  def medicalcare
  end

  def vaccine
  end

  private

  def overview_params
    params.require(:overview).permit(:physicalfinding_measuring_date, :weight, :height, :abdominal_circumference,:bmi, :blood_urine_test_date, :image,:medical_care_date, :clinic_name, :disease_name, :treatment_medicine, :vaccine_date, :vaccine_id).merge(user_id: current_user.id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_overview
    @overview = Overview.includes(:user).find(params[:id])
  end

  def set_chart
    if user_signed_in?
      physicalfinding_measuring_date = Overview.where.not(physicalfinding_measuring_date:nil).where(user_id: current_user.id).order(physicalfinding_measuring_date: :asc).pluck(:physicalfinding_measuring_date)
      weight = Overview.where.not(physicalfinding_measuring_date:nil).where(user_id: current_user.id).order(physicalfinding_measuring_date: :asc).pluck(:weight)
      bmi = Overview.where.not(physicalfinding_measuring_date:nil).where(user_id: current_user.id).order(physicalfinding_measuring_date: :asc).pluck(:bmi)
      abdominal_circumference = Overview.where.not(physicalfinding_measuring_date:nil).where(user_id: current_user.id).order(physicalfinding_measuring_date: :asc).pluck(:abdominal_circumference)

      @chart = LazyHighCharts::HighChart.new("graph") do |c|
        # c.title(text: "体重・腹囲 推移")
        c.xAxis(categories: physicalfinding_measuring_date)
        c.yAxis(title: {text: 'kg / cm'})
        c.series(name: "腹囲 cm", data: abdominal_circumference)
        c.series(name: "体重 kg", data: weight)
        c.series(name: "BMI", data: bmi)
      end
    end
  end

  def overview_physicalfinding_measuring
    @overview_physicalfinding_measurings = Overview.includes(:user).where.not(physicalfinding_measuring_date:nil).order(physicalfinding_measuring_date: :desc).where(params[:id])
  end

  def overview_blood_urine_test
    @overview_blood_urine_tests = Overview.includes(:user).where.not(blood_urine_test_date:nil).order(blood_urine_test_date: :desc).where(params[:id])
  end

  def overview_medical_care
    @overview_medical_cares = Overview.includes(:user).where.not(medical_care_date:nil).order(medical_care_date: :desc).where(params[:id])
  end

  def overview_vaccines
    @overview_vaccines = Overview.includes(:user).where.not(vaccine_date:nil).order(vaccine_date: :desc).where(params[:id])
  end

end
