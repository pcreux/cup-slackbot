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
  $.getJSON('data.json?lastMonthStart=' + lastMonthStart + '&lastMonthEnd=' + lastMonthEnd + '&thisMonthStart' + thisMonthStart + '&thisMonthEnd' + thisMonthEnd, function(apiData) {
     updatePage(apiData);
  });
}

function updatePage(apiData) {
	$("#totalCupsSaved").html(apiData.totalCupsSaved);
	$("#totalMoneySaved").html("$" + (apiData.totalCupsSaved * nonreusableCupValue).toFixed(2));

	$("#lastMonthTopSaver").html(apiData.lastMonthTopSaver);
	$("#lastMonthTopSaverImage").attr("src", apiData.lastMonthTopSaverImage);
	$("#lastMonthHeader").html(lastMonthString + " Winner");
	$("#lastMonthValues").html(apiData.lastMonthTopSaverCupsSaved + " cups ($" + (apiData.lastMonthTopSaverCupsSaved * nonreusableCupValue).toFixed(2) + ")");

	$("#thisMonthHeader").html("Top 5 " + thisMonthString);

	$("#top10").html("");
	for (saver of apiData.thisMonthTops) {
	$("#top10").append("<a href='#' class='list-group-item'><img class='user-image' src='" + saver.imageSource + "' /> " + saver.name +
			"<span class='pull-right leaderboard-amount'><em>" + saver.cupsSaved + " cups ($" + (saver.cupsSaved * nonreusableCupValue).toFixed(2) + ")</em></span></a>");
	};

	trendChart.setData(apiData.trendData); // this will redraw the chart

	$("#lastUpdated").html("Last Refreshed: " + new Date());
}
