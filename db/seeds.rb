Message.delete_all
Channel.delete_all

channels = 10.times.map do
  Channel.create(name: Faker::Lorem.word)
end

20.times do
  Message.create(channel: channels.sample, text: Faker::Lorem.sentence)
end
