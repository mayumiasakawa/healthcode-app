FactoryBot.define do
  factory :overview do
    measuring_date          { 2000-01-01 }
    weight                  { 60 }
    height                  { 160 }
    abdominal_circumference { 80 }
  end
end
