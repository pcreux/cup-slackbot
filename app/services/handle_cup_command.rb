class HandleCupCommand
  include Virtus.model

  attribute :command, SlackCommand
  attribute :slack_client, Object, default: :default_slack_client

  def self.call(args)
    new(command: SlackCommand.new(args)).call
  end

  def call
    find_user || create_user!
    record_cup!

    reply
  end

  def record_cup!
    Cup.create!(
      user_identifier: command.user_id,
      user_name: command.user_name,
    )
  end

  def find_user
    User.find_by_slack_identifier(command.user_id)
  end

  def create_user!
    slack_user = slack_client.users_info(user: command.user_id).user

    User.create!(
      raw: slack_user.to_hash,
      slack_identifier: command.user_id,
      name: slack_user.name,
      email: slack_user.profile.email,
      first_name: slack_user.profile.first_name,
      last_name: slack_user.profile.last_name,
      real_name: slack_user.profile.real_name,
      avatar_72: slack_user.profile.image_72,
      avatar_192: slack_user.profile.image_192
    )
  end

  def reply
    "Thanks for using a reusable cup! You rock!"
  end

  def default_slack_client
    Rails.application.config.slack_client_class.constantize.new
  end
end
