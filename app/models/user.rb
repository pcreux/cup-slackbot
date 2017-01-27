class User < ApplicationRecord
  has_many :cups, foreign_key: "user_identifier", primary_key: "slack_identifier"
end
