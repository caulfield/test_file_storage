FactoryGirl.define do
  factory :asset do
    name 'AssetName'
    file { File.open('./spec/fixtures/file.txt') }
    user
  end
end
