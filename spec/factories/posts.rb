require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { Faker::Coffee.blend_name }
    f.markdown { Faker::Markdown.random }
  end
end