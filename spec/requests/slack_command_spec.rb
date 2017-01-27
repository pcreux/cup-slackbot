require 'rails_helper'

describe "POST /slack_command" do
  let(:args) do
    {
      "token"=>"TOKEN",
      "team_id"=>"TEAM_ID",
      "team_domain"=>"TEAM_DOMAIN",
      "channel_id"=>"CHANNEL_ID",
      "channel_name"=>"CHANNEL_NAME",
      "user_id"=>"USER_ID",
      "user_name"=>"bob",
      "command"=>"/cup",
      "text"=>"",
      "response_url"=>"https://hooks.slack.com/commands/something/something"
    }
  end

  it "renders a thank you note" do
    expect {
      post "/slack_command", params: args
    }.to change { Cup.count }.by(1)

    expect(response.code).to eq "200"
    expect(response.body).to_not be_empty

    expect(Cup.last).to have_attributes(
      user_identifier: "USER_ID",
      user_name: "bob"
    )

    expect(User.last).to have_attributes(
			name: "bob",
			real_name: "Bob Meh",
			email: "bob.meh@example.com"
		)

  end
end
