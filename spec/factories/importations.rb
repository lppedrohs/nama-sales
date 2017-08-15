FactoryGirl.define do
  factory :importation do
    file { File.new("#{Rails.root}/lib/assets/sales-file-example.txt") }
  end
end
