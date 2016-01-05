FactoryGirl.define do
  factory :goal do
    private? false
    completed? false
    name { Faker::Hipster.word }
    description { Faker::Hipster.sentence }
  end

end
