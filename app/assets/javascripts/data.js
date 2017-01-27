var nonreusableCupValue = 0.05;

var monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];

var monthNamesShort = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
];

var now = new Date();
var lastMonthStart = new Date(Date.UTC(now.getFullYear(), now.getMonth() - 1, 1));
var lastMonthEnd = new Date(Date.UTC(now.getFullYear(), now.getMonth(), 0, 11, 59, 59));
var lastMonthString = monthNames[lastMonthEnd.getMonth()] + " " + lastMonthEnd.getFullYear();

var thisMonthStart = new Date(Date.UTC(now.getFullYear(), now.getMonth(), 1));
var thisMonthEnd = new Date(Date.UTC(now.getFullYear(), now.getMonth() + 1, 0, 11, 59, 59));
var thisMonthString = monthNames[thisMonthEnd.getMonth()] + " " + thisMonthEnd.getFullYear();

var trendChart;

$(function() {
  trendChart = Morris.Line({
      element: 'unbounce-reusable-trends',
      lineColors: ['#337AB7'],
      xkey: 'period',
      ykeys: ['cupsSaved'],
      labels: ['Cups Saved'],
      pointSize: 8,
      hideHover: false,
      resize: true,
      xLabelFormat: function(d) {
        return monthNamesShort[d.getMonth()] + ' ' + d.getFullYear();
      },
  });

  update();
  setInterval(function(){
    update();
  }, 5000);
});

function update() {
  // $.getJSON('http://ourApi?lastMonthStart=' + lastMonthStart + '&lastMonthEnd=' + lastMonthEnd + '&thisMonthStart' + thisMonthStart + '&thisMonthEnd' + thisMonthEnd, function(apiData) {
  //   updatePage(apiData);
  // });

  updatePage({
    totalCupsSaved: 45,
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
  });
}

function updatePage(apiData) {
  $("#totalCupsSaved").html(apiData.totalCupsSaved);
  $("#totalMoneySaved").html("$" + apiData.totalCupsSaved * nonreusableCupValue);

  $("#lastMonthTopSaver").html(apiData.lastMonthTopSaver);
  $("#lastMonthTopSaverImage").attr("src", apiData.lastMonthTopSaverImage);
  $("#lastMonthHeader").html(lastMonthString + " Winner");
  $("#lastMonthValues").html(apiData.lastMonthTopSaverCupsSaved + " cups ($" + (apiData.lastMonthTopSaverCupsSaved * nonreusableCupValue) + ")");

  $("#thisMonthHeader").html("Top 5 " + thisMonthString);

  $("#top10").html("");
  for (saver of apiData.thisMonthTops) {
    $("#top10").append("<a href='#' class='list-group-item'><img class='user-image' src='" + saver.imageSource + "' /> " + saver.name +
      "<span class='pull-right leaderboard-amount'><em>" + saver.cupsSaved + " cups ($" + saver.cupsSaved * nonreusableCupValue + ")</em></span></a>");
  };

  trendChart.setData(apiData.trendData); // this will redraw the chart

  $("#lastUpdated").html("Last Refreshed: " + new Date());
}
