class HandleCupCommand
  include Virtus.model

  attribute :command, SlackCommand

  def self.call(args)
    new(command: SlackCommand.new(args)).call
  end

  def call
    Cup.create!(
      user_identifier: command.user_id,
      user_name: command.user_name
    )
  end
end
