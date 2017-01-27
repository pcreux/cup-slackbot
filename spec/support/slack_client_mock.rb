class SlackClientMock
  def users_info(user:)
		Slack::Messages::Message.new(
			"ok" => true,
			"user" => {
				"id" => "USER_ID",
				"team_id" => "TEAM_ID",
				"name" => "bob",
				"deleted" => false,
				"status" => nil,
				"color" => "e0a729",
				"real_name" => "Bob Meh",
				"tz" => "America/Los_Angeles",
				"tz_label" => "Pacific Standard Time",
				"tz_offset" => -28800,
				"profile" => {
					"first_name" => "Bob",
					"last_name" => "Meh",
					"avatar_hash" => "dd123",
					"image_24" => "https://avatars.slack-edge.com/2016-10-11/90190409153_dd12324.jpg",
					"image_32" => "https://avatars.slack-edge.com/2016-10-11/90190409153_dd12332.jpg",
					"image_48" => "https://avatars.slack-edge.com/2016-10-11/90190409153_dd12348.jpg",
					"image_72" => "https://avatars.slack-edge.com/2016-10-11/90190409153_dd12372.jpg",
					"image_192" => "https://avatars.slack-edge.com/2016-10-11/90190409153_dd123192.jpg",
					"image_512" => "https://avatars.slack-edge.com/2016-10-11/90190409153_dd123512.jpg",
					"image_1024" => "https://avatars.slack-edge.com/2016-10-11/90190409153_dd1231024.jpg",
					"image_original" => "https://avatars.slack-edge.com/2016-10-11/90190409153_dd123original.jpg",
					"title" => "",
					"phone" => "",
					"skype" => "",
					"real_name" => "Bob Meh",
					"real_name_normalized" => "Bob Meh",
					"email" => "bob.meh@example.com"
				},
				"is_admin" => false,
				"is_owner" => false,
				"is_primary_owner" => false,
				"is_restricted" => false,
				"is_ultra_restricted" => false,
				"is_bot" => false,
				"has_2fa" => false
			}
		)
  end
end
