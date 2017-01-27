require 'rails_helper'

describe "POST /slack_command" do
  it "renders a thank you note" do
    post "/slack_command"
    expect(response.code).to eq "200"
    expect(response.body).to include "Thank"
  end
end
