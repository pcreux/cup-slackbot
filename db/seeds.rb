[
  {
    "slack_identifier"=>"123AB",
    "name"=>"philippe",
    "email"=>"philippe@example.com",
    "first_name"=>"Philippe",
    "last_name"=>"Creux",
    "real_name"=>"Philippe Creux",
    "avatar_72"=>"https://avatars.slack-edge.com/2016-10-11/90190409153_dd6490c09d607f12e4be_72.jpg",
    "avatar_192"=>"https://avatars.slack-edge.com/2016-10-11/90190409153_dd6490c09d607f12e4be_192.jpg"
  },
  {
    "slack_identifier"=>"234AB",
    "name"=>"vitor",
    "email"=>"vitor@example.com",
    "first_name"=>"Vitor",
    "last_name"=>"Gurgel",
    "real_name"=>"Vitor Gurgel",
    "avatar_72"=>"https://avatars.slack-edge.com/2016-10-05/87926542192_907e9f8d8502fbb137a9_72.jpg",
    "avatar_192"=>"https://avatars.slack-edge.com/2016-10-05/87926542192_907e9f8d8502fbb137a9_192.jpg"
  },
  {
    "slack_identifier"=>"22333ABC",
    "name"=>"kyle",
    "email"=>"kyle@example.com",
    "first_name"=>"Kyle",
    "last_name"=>"Kury",
    "real_name"=>"Kyle Kury",
    "avatar_72"=>"https://avatars.slack-edge.com/2016-07-18/60855270035_3c06e748fc91eb6f0739_72.jpg",
    "avatar_192"=>"https://avatars.slack-edge.com/2016-07-18/60855270035_3c06e748fc91eb6f0739_192.jpg"
  }
].each do |attributes|
  unless User.find_by_slack_identifier(attributes.fetch("slack_identifier"))
    User.create!(attributes)
  end
end

users = User.all.to_a

100.times do
  user = users.sample
  cup = Cup.create!(
    user_identifier: user.slack_identifier,
    user_name: user.name
  )

  cup.update_attribute(:created_at, Time.now - rand(3600 * 24 * 60))
end
