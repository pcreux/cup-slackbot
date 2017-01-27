class GetDashboardData
  def self.call
    new.call
  end

  def call
    {
      totalCupsSaved: rand(45).to_i,
      lastMonthTopSaver: "Bruno",
      lastMonthTopSaverImage: "user_profile_bruno.png",
      lastMonthTopSaverCupsSaved: 100,
      thisMonthTops: [
        {
          name: "Bruno",
          imageSource: "user_profile_bruno.png",
          cupsSaved: 500
        },
        {
          name: "Mars",
          imageSource: "user_profile_bruno.png",
          cupsSaved: 1450
        }
      ],
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
end
