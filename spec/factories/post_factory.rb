Factory.define :post do |p|
  p.title Faker::Lorem.sentence
  p.body Faker::Lorem.paragraphs
  p.commented [true, false][rand(2)]
  p.published [true, false][rand(2)]
end