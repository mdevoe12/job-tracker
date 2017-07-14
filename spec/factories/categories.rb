FactoryGirl.define do
  factory :category do
    sequence :title do |t|
      "sample category #{t}"
    end
  end
end
