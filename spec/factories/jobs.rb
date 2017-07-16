FactoryGirl.define do
  factory :job do

    sequence :title do |t|
      "job #{t}"
    end
    description "super descrip"

    sequence :level_of_interest do |t|
      t
    end
    
    company
    city "city of dreams"
    category
  end
end
