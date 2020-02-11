100.times do |n|
  text = Faker::Lorem.paragraph.slice(0...140)
  Status.create!(text: text)
end
