require 'rails_helper'

RSpec.describe User, type: :model do
  it "has many cups" do
    cup = Cup.create!(user_identifier: "bob123", user_name: "Bob")
    user = User.create!(slack_identifier: "bob123")

    expect(user.cups).to eq [cup]
  end
end
