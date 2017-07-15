FactoryGirl.define do
  factory :job do

    sequence :title do |t|
      "job #{t}"
    end
    description "super descrip"
    level_of_interest 30
    company
    city "city of dreams"
    category
  end
end
