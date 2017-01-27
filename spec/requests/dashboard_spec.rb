require 'rails_helper'

describe "/" do
  it "works" do
    get "/"
    expect(response.code).to eq "200"
  end
end
