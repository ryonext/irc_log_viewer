Message.delete_all
Channel.delete_all

channels = 10.times.map do
  Channel.create(name: Faker::Lorem.word)
end

users = 5.times.map do
  User.create(name: Faker::Name.name)
end

100.times do
  Message.create(
    channel: channels.first,
    user: users.sample,
    text: Faker::Lorem.sentence,
    published_at: Faker::Time.between(2.days.ago, Time.zone.now),
  )
end
