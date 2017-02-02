class GetDashboardData
  def self.call
    new.call
  end

  def call
    {
      totalCupsSaved: Cup.count,
      lastMonthTopSaver: last_month_winner.first_name,
      lastMonthTopSaverImage: last_month_winner.avatar_72,
      lastMonthTopSaverCupsSaved: last_month_winner_cups,
      thisMonthTops: top_5,
      trendData: trend,
    }
  end

  def top_5
    this_month_cups.
      group(:user_identifier).
      count.
      sort_by { |user_identifier, count| count }.
      reverse.first(5).
      map do |user_identifier, count|
        user = User.find_by_slack_identifier(user_identifier)
        {
          name: user.first_name,
          imageSource: user.avatar_72,
          cupsSaved: count
        }
    end.compact
  end

  def trend
    Cup.
      group("date_trunc('month', created_at)").
      count.
      sort_by { |date, _| date }.
      map do |date, total|
      {
        period: date.strftime("%Y-%m"),
        cupsSaved: total
      }
    end
  end

  def last_month_winner
    @last_month_winner ||= get_last_month_winner
  end

  def get_last_month_winner
    user_identifier = last_month_cups.
      group(:user_identifier).
      count.
      sort_by { |user_identifier, count| count }.
      reverse.first[0]

    if user_identifier
      User.find_by_slack_identifier(user_identifier)
    else
      User.first
    end
  end

  def last_month_winner_cups
    last_month_cups.where(user_identifier: last_month_winner.slack_identifier).count
  end

  def last_month_cups
    Cup.
      where("created_at < ?", Time.now.beginning_of_month).
      where("created_at > ?", 1.month.ago.beginning_of_month)
  end

  def this_month_cups
    Cup.
      where("created_at > ?", Time.now.beginning_of_month)
  end
end
