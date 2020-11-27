require 'rails_helper'

RSpec.describe Overview, type: :model do
  before do
    @overview = FactoryBot.build(:overview)
  end
  describe '身体特徴登録' do
    context '登録がうまくいく時' do
      it 'measuring_dateとweight 、height、abdominal_circumferenceのいずれが存在すれば登録できる' do
        expect(@overview).to be_valid
      end
    end

    context '登録がうまくいかない時' do
      it 'measuring_dateが空では登録できない' do
        @overview.measuring_date = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Measuring date can't be blank")
      end
      it 'weight 、height、abdominal_circumferenceが空では登録できない' do
        @overview.height = ''
        @overview.weight = ''
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Height is not a number", "Height is invalid", "Height can't be blank", "Weight is not a number", "Weight is invalid","Weight can't be blank", "Abdominal circumference is not a number", "Abdominal circumference is invalid", "Abdominal circumference can't be blank")
      end
      it 'heightが1より小さいと登録できない' do
        @overview.weight = ''
        @overview.height = '0.5'
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Height must be greater than or equal to 1")
      end
      it 'heightが200より大きいとと登録できない' do
        @overview.weight = ''
        @overview.height = '300'
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Height must be less than or equal to 200")
      end
      it 'heightが半角数字でないと登録できない' do
        @overview.weight = ''
        @overview.height = '１６０'
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Height is not a number")
      end
      it 'weightが1より小さいと登録できない' do
        @overview.weight = '0.5'
        @overview.height = ''
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Weight must be greater than or equal to 1")
      end
      it 'weightが200より大きいとと登録できない' do
        @overview.weight = '300'
        @overview.height = ''
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Weight must be less than or equal to 200")
      end
      it 'weightが半角数字でないと登録できない' do
        @overview.weight = '５０'
        @overview.height = ''
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Weight is not a number")
      end
      it 'abdominalcircumferenceが1より小さいと登録できない' do
        @overview.weight = ''
        @overview.height = ''
        @overview.abdominal_circumference = '0.5'
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Abdominal circumference must be greater than or equal to 1")
      end
      it 'abdominalcircumferenceが200より大きいとと登録できない' do
        @overview.weight = ''
        @overview.height = ''
        @overview.abdominal_circumference = '300'
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Abdominal circumference must be less than or equal to 200")
      end
      it 'abdominalcircumferenceが半角数字でないと登録できない' do
        @overview.weight = ''
        @overview.height = ''
        @overview.abdominal_circumference = '５０'
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Abdominal circumference is not a number")
      end
    end
  end
end
