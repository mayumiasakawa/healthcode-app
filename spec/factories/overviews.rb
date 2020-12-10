FactoryBot.define do
  factory :overview do
    association :user

    physicalfinding_measuring_date { Faker::Date.birthday }
    weight                         { 60 }
    height                         { 160 }
    abdominal_circumference        { 80 }
    blood_urine_test_date          { Faker::Date.birthday }
    medical_care_date             { Faker::Date.birthday }
    clinic_name                    {"クリニック"}
    disease_name                   {"病名"}
    treatment_medicine             {"薬名"}
    vaccine_date                   { Faker::Date.birthday }
    vaccine_id                     { 4 }

    after(:build) do |overview|
      overview.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
