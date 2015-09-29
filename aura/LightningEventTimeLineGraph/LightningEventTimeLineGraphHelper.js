({
  setBarChart : function(component) {
    var randomScalingFactor = function(){ return Math.round(Math.random()*100)};

    var barChartData = {
      labels : ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],
      datasets : [
        {
            fillColor : "rgb(75, 202, 129)",
            strokeColor : "rgb(75, 202, 129)",
            highlightFill: "rgb(75, 202, 129)",
            highlightStroke: "rgb(75, 202, 129)",
            data : [
              component.get('v.eventsBySunday').length,
              component.get('v.eventsByMonday').length,
              component.get('v.eventsByTuesday').length,
              component.get('v.eventsByWednesday').length,
              component.get('v.eventsByThursday').length,
              component.get('v.eventsByFriday').length,
              component.get('v.eventsBySaturday').length
            ]
        }
      ]
    }
            
    var el = component.find('chart').getElement();
    var ctx = el.getContext('2d');
    var myNewChart = new Chart(ctx).Bar(barChartData);
  },
})