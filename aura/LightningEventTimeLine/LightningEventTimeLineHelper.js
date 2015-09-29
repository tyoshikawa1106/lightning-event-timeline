({
  getWeekEvents: function(component) {
    var action = component.get("c.getWeekEvents");
    action.setCallback(this, function(data) {
      var result = data.getReturnValue();
      component.set("v.eventsByAll", result.eventsByAll);
      component.set("v.eventsByMonday", result.eventsByMonday);
      component.set("v.eventsByTuesday", result.eventsByTuesday);
      component.set("v.eventsByWednesday", result.eventsByWednesday);
      component.set("v.eventsByThursday", result.eventsByThursday);
      component.set("v.eventsByFriday", result.eventsByFriday);
      component.set("v.eventsBySaturday", result.eventsBySaturday);
      component.set("v.eventsBySunday", result.eventsBySunday);
    });
    $A.enqueueAction(action);
  },
  clearTabSelect: function(component) {
    var elTabAll = component.find('tab-all');
    $A.util.removeClass(elTabAll.getElement(), 'slds-active');

    var elTabMon = component.find('tab-mon');
    $A.util.removeClass(elTabMon.getElement(), 'slds-active');

    var elTabTue = component.find('tab-tue');
    $A.util.removeClass(elTabTue.getElement(), 'slds-active');
    
    var elTabWed = component.find('tab-wed');
    $A.util.removeClass(elTabWed.getElement(), 'slds-active');
    
    var elTabThu = component.find('tab-thu');
    $A.util.removeClass(elTabThu.getElement(), 'slds-active');
    
    var elTabFri = component.find('tab-fri');
    $A.util.removeClass(elTabFri.getElement(), 'slds-active');
    
    var elTabSat = component.find('tab-sat');
    $A.util.removeClass(elTabSat.getElement(), 'slds-active');
    
    var elTabSun = component.find('tab-sun');
    $A.util.removeClass(elTabSun.getElement(), 'slds-active');

    var elTabGraph = component.find('tab-graph');
    $A.util.removeClass(elTabGraph.getElement(), 'slds-active');

    component.set('v.isViewGraph', false);
  }, 
  activeTabSelect: function(component, keyword) {
    var el = component.find(keyword);
    $A.util.addClass(el.getElement(), 'slds-active');
    
    if (keyword === 'tab-graph') {
      component.set('v.isViewGraph', true);
    }
  },
  clearContentShow: function(component) {
    var elConentAll = component.find('content-all');
    $A.util.removeClass(elConentAll.getElement(), 'slds-show');
    $A.util.addClass(elConentAll.getElement(), 'slds-hide');
    
    var elConentMon = component.find('content-mon');
    $A.util.removeClass(elConentMon.getElement(), 'slds-show');
    $A.util.addClass(elConentMon.getElement(), 'slds-hide');
    
    var elContentTue = component.find('content-tue');
    $A.util.removeClass(elContentTue.getElement(), 'slds-show');
    $A.util.addClass(elContentTue.getElement(), 'slds-hide');
    
    var elContentWed = component.find('content-wed');
    $A.util.removeClass(elContentWed.getElement(), 'slds-show');
    $A.util.addClass(elContentWed.getElement(), 'slds-hide');
    
    var elContentThu = component.find('content-thu');
    $A.util.removeClass(elContentThu.getElement(), 'slds-show');
    $A.util.addClass(elContentThu.getElement(), 'slds-hide');
    
    var elContentFri = component.find('content-fri');
    $A.util.removeClass(elContentFri.getElement(), 'slds-show');
    $A.util.addClass(elContentFri.getElement(), 'slds-hide');
    
    var elContentSat = component.find('content-sat');
    $A.util.removeClass(elContentSat.getElement(), 'slds-show');
    $A.util.addClass(elContentSat.getElement(), 'slds-hide');
    
    var elContentSun = component.find('content-sun');
    $A.util.removeClass(elContentSun.getElement(), 'slds-show');
    $A.util.addClass(elContentSun.getElement(), 'slds-hide');

    var elContentGraph = component.find('content-graph');
    $A.util.removeClass(elContentGraph.getElement(), 'slds-show');
    $A.util.addClass(elContentGraph.getElement(), 'slds-hide');
  },
  showContent: function(component, keyword) {
    var el = component.find(keyword);
    $A.util.addClass(el.getElement(), 'slds-show');
  },
})