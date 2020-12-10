require 'rails_helper'

RSpec.describe Overview, type: :model do
  before do
    @overview = FactoryBot.build(:overview)
  end
  describe 'データ登録' do
    context '登録がうまくいく時' do
      it '全ての入力が存在すれば登録できる' do
        expect(@overview).to be_valid
      end

      it '身長体重腹囲の測定日・身長の入力があれば登録できる' do
        @overview.physicalfinding_measuring_date = '2020-01-01'
        @overview.height = '150'
        @overview.weight = ''
        @overview.abdominal_circumference = ''
        @overview.blood_urine_test_date = ''
        @overview.image = nil
        @overview.medical_care_date = ''
        @overview.clinic_name = ''
        @overview.disease_name = ''
        @overview.treatment_medicine = ''
        @overview.vaccine_date = ''
        @overview.vaccine_id = '1'
        expect(@overview).to be_valid
      end
      it '身長体重腹囲の測定日・体重の入力があれば登録できる' do
        @overview.physicalfinding_measuring_date = '2020-01-01'
        @overview.height = ''
        @overview.weight = '50'
        @overview.abdominal_circumference = ''
        @overview.blood_urine_test_date = ''
        @overview.image = nil
        @overview.medical_care_date = ''
        @overview.clinic_name = ''
        @overview.disease_name = ''
        @overview.treatment_medicine = ''
        @overview.vaccine_date = ''
        @overview.vaccine_id = '1'
        expect(@overview).to be_valid
      end
      it '身長体重腹囲の測定日・腹囲の入力があれば登録できる' do
        @overview.physicalfinding_measuring_date = '2020-01-01'
        @overview.height = ''
        @overview.weight = ''
        @overview.abdominal_circumference = '80'
        @overview.blood_urine_test_date = ''
        @overview.image = nil
        @overview.medical_care_date = ''
        @overview.clinic_name = ''
        @overview.disease_name = ''
        @overview.treatment_medicine = ''
        @overview.vaccine_date = ''
        @overview.vaccine_id = '1'
        expect(@overview).to be_valid
      end
      it '採血・採尿の測定日・画像の入力があれば登録できる' do
        @overview.physicalfinding_measuring_date = ''
        @overview.height = ''
        @overview.weight = ''
        @overview.abdominal_circumference = ''
        @overview.blood_urine_test_date = '2020-01-01'
        @overview.image = fixture_file_upload('public/images/test_image.jpg')
        @overview.medical_care_date = ''
        @overview.clinic_name = ''
        @overview.disease_name = ''
        @overview.treatment_medicine = ''
        @overview.vaccine_date = ''
        @overview.vaccine_id = '1'
        expect(@overview).to be_valid
      end
      it '受診日・病院名、病名、処置・薬の入力があれば登録できる' do
        @overview.physicalfinding_measuring_date = ''
        @overview.height = ''
        @overview.weight = ''
        @overview.abdominal_circumference = ''
        @overview.blood_urine_test_date = ''
        @overview.image = nil
        @overview.medical_care_date = '2020-01-01'
        @overview.clinic_name = 'クリニック'
        @overview.disease_name = '膀胱炎'
        @overview.treatment_medicine = '抗生剤内服'
        @overview.vaccine_date = ''
        @overview.vaccine_id = '1'
        expect(@overview).to be_valid
      end
      it '接種日・ワクチンの種類の入力があれば登録できる' do
        @overview.physicalfinding_measuring_date = ''
        @overview.height = ''
        @overview.weight = ''
        @overview.abdominal_circumference = ''
        @overview.blood_urine_test_date = ''
        @overview.image = nil
        @overview.medical_care_date = ''
        @overview.clinic_name = ''
        @overview.disease_name = ''
        @overview.treatment_medicine = ''
        @overview.vaccine_date = '2020-01-01'
        @overview.vaccine_id = '3'
      end

    end

    context '登録がうまくいかない時' do
      it '全ての項目が空では登録できない' do
        @overview.physicalfinding_measuring_date = ''
        @overview.height = ''
        @overview.weight = ''
        @overview.abdominal_circumference = ''
        @overview.blood_urine_test_date = ''
        @overview.image = nil
        @overview.medical_care_date = ''
        @overview.clinic_name = ''
        @overview.disease_name = ''
        @overview.treatment_medicine = ''
        @overview.vaccine_date = ''
        @overview.vaccine_id = '1'
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Physicalfinding measuring date can't be blank", "medical care date can't be blank")
      end

      it 'いずれかの日付が入力されていないと登録できない' do
        @overview.physicalfinding_measuring_date = ''
        @overview.blood_urine_test_date = ''
        @overview.medical_care_date = ''
        @overview.vaccine_date = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Physicalfinding measuring date can't be blank", "medical care date can't be blank")
      end

      it '身長体重腹囲の測定日があっても・身長体重腹囲の入力がなければ登録できない' do
        @overview.physicalfinding_measuring_date = '2020-01-01'
        @overview.height = ''
        @overview.weight = ''
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Height is not a number", "Height is invalid", "Height can't be blank","Weight is not a number", "Weight is invalid", "Weight can't be blank","Abdominal circumference is not a number", "Abdominal circumference is invalid", "Abdominal circumference can't be blank")
      end
      it '身長体重腹囲の入力があっても、測定日の入力がなければ登録できない' do
        @overview.physicalfinding_measuring_date = ''
        @overview.height = '150'
        @overview.weight = '50'
        @overview.abdominal_circumference = '80'
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Physicalfinding measuring date can't be blank")
      end
      it "身長が半角数字ではないと登録できない" do
        @overview.physicalfinding_measuring_date = '2020-01-01'
        @overview.height = '１５０'
        @overview.weight = ''
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Height is not a number")
      end
      it "身長が200より大きいと登録できない" do
        @overview.physicalfinding_measuring_date = '2020-01-01'
        @overview.height = '300'
        @overview.weight = ''
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Height must be less than or equal to 200")
      end
      it "体重が半角数字ではないと登録できない" do
        @overview.physicalfinding_measuring_date = '2020-01-01'
        @overview.height = ''
        @overview.weight = '６０'
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Weight is not a number")
      end
      it "体重が200より大きいと登録できない" do
        @overview.physicalfinding_measuring_date = '2020-01-01'
        @overview.height = ''
        @overview.weight = '300'
        @overview.abdominal_circumference = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Weight must be less than or equal to 200")
      end
      it "腹囲が半角数字ではないと登録できない" do
        @overview.physicalfinding_measuring_date = '2020-01-01'
        @overview.height = ''
        @overview.weight = ''
        @overview.abdominal_circumference = '７０'
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Abdominal circumference is not a number")
      end
      it "腹囲が200より大きいと登録できない" do
        @overview.physicalfinding_measuring_date = '2020-01-01'
        @overview.height = ''
        @overview.weight = ''
        @overview.abdominal_circumference = '300'
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Abdominal circumference must be less than or equal to 200")
      end

      it '採血・採尿の測定日があっても・画像の添付がなければ登録できない' do
        @overview.blood_urine_test_date = '2020-01-01'
        @overview.image = nil
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Image can't be blank")
      end
      it '画像の添付があっても・測定日がなければ登録できない' do
        @overview.blood_urine_test_date = ''
        @overview.image = fixture_file_upload('public/images/test_image.jpg')
        @overview.valid?
        expect(@overview.errors.full_messages).to include ("Blood urine test date can't be blank")
      end

      it '受診日があっても・病院名・病名・処置名の入力がなければ登録できない' do
        @overview.medical_care_date = '2020-01-01'
        @overview.clinic_name = ''
        @overview.disease_name = ''
        @overview.treatment_medicine = ''
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Clinic name can't be blank", "Disease name can't be blank", "Treatment medicine can't be blank")
      end
      it '病名・処置名があっても・受診日の入力がなければ登録できない' do
        @overview.medical_care_date = ''
        @overview.clinic_name = 'クリニック'
        @overview.disease_name = '病名'
        @overview.treatment_medicine = '薬'
        @overview.valid?
        expect(@overview.errors.full_messages).to include("medical care date can't be blank")
      end
      it '接種日があっても・ワクチンの種類の入力がなければ(1であれば)登録できない' do
        @overview.vaccine_date = '2020-01-01'
        @overview.vaccine_id = '1'
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Vaccine must be other than 1")
      end
      it 'ワクチンの種類があっても(1以外)・接種日の入力がなければ登録できない' do
        @overview.vaccine_date = ''
        @overview.vaccine_id = '5'
        @overview.valid?
        expect(@overview.errors.full_messages).to include("Vaccine date can't be blank")
      end
    end
  end
end
