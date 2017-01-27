class GetDashboardData
  def self.call
    new.call
  end

  def call
    {
      totalCupsSaved: Cup.count,
      lastMonthTopSaver: last_month_winner.first_name,
      lastMonthTopSaverImage: last_month_winner.avatar_72,
      lastMonthTopSaverCupsSaved: 0,
      thisMonthTops: top_5,
      trendData: trend,
    }
  end

  def top_5
    Cup.
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
    User.last
  end
end
