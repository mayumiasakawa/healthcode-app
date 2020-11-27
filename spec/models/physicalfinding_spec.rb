require 'rails_helper'

RSpec.describe Physicalfinding, type: :model do
  before do
    @physicalfinding = FactoryBot.build(:physicalfinding)
  end
  describe '身体特徴登録' do
    context '新規登録がうまくいく時' do
      it 'measuring_dateとweight 、height、abdominal_circumferenceのいずれが存在すれば登録できる' do
        expect(@physicalfinding).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'measuring_dateが空では登録できない' do
        @physicalfinding.measuring_date = ''
        @physicalfinding.valid?
        expect(@physicalfinding.errors.full_messages).to include("Measuring date can't be blank")
      end
      it 'weight 、height、abdominal_circumferenceが空では登録できない' do
        @physicalfinding.weight = ''
        @physicalfinding.height = ''
        @physicalfinding.abdominal_circumference = ''
        @physicalfinding.valid?
        expect(@physicalfinding.errors.full_messages).to include("Height or weight or abdominal is invalid")
      end
    end
  end
end
