class SlackCommand
  include Virtus.model

  attribute :token # gIkuvaNzQIHg97ATvDxqgjtO
  attribute :team_id # T0001
  attribute :team_domain # example
  attribute :channel_id # C2147483705
  attribute :channel_name # test
  attribute :user_id # U2147483697
  attribute :user_name # Steve
  attribute :command # /cup
  attribute :text # dashboard
  attribute :response_url # https://hooks.slack.com/commands/1234/5678
end
