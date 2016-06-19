Channel.delete_all

10.times do
  Channel.create(name: Faker::Lorem.word)
end
