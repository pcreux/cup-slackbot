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
      trendData: [{
          period: '2016-08',
          cupsSaved: 1423
      },{
          period: '2016-09',
          cupsSaved: 500
      },{
          period: '2016-10',
          cupsSaved: 2666
      }, {
          period: '2016-11',
          cupsSaved: 2778
      }, {
          period: '2016-12',
          cupsSaved: 4912
      }, {
          period: '2017-01',
          cupsSaved: 3767
      }]
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

  end

  def last_month_winner
    User.last
  end
end
