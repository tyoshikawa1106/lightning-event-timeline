({
  init: function(component, event, helper) {
    helper.getWeekEvents(component);
  },
  clickTabAll: function(component, event, helper) {
    helper.clearTabSelect(component);
    helper.activeTabSelect(component, 'tab-all');
    helper.clearContentShow(component);
    helper.showContent(component, 'content-all');
  },
  clickTabMon: function(component, event, helper) {
    helper.clearTabSelect(component);
    helper.activeTabSelect(component, 'tab-mon');
    helper.clearContentShow(component);
    helper.showContent(component, 'content-mon');
  },
  clickTabTue: function(component, event, helper) {
    helper.clearTabSelect(component);
    helper.activeTabSelect(component, 'tab-tue');
    helper.clearContentShow(component);
    helper.showContent(component, 'content-tue');
  },
  clickTabWed: function(component, event, helper) {
    helper.clearTabSelect(component);
    helper.activeTabSelect(component, 'tab-wed');
    helper.clearContentShow(component);
    helper.showContent(component, 'content-wed');
  },
  clickTabThu: function(component, event, helper) {
    helper.clearTabSelect(component);
    helper.activeTabSelect(component, 'tab-thu');
    helper.clearContentShow(component);
    helper.showContent(component, 'content-thu');
  },
  clickTabFri: function(component, event, helper) {
    helper.clearTabSelect(component);
    helper.activeTabSelect(component, 'tab-fri');
    helper.clearContentShow(component);
    helper.showContent(component, 'content-fri');
  },
  clickTabSat: function(component, event, helper) {
    helper.clearTabSelect(component);
    helper.activeTabSelect(component, 'tab-sat');
    helper.clearContentShow(component);
    helper.showContent(component, 'content-sat');
  },
  clickTabSun: function(component, event, helper) {
    helper.clearTabSelect(component);
    helper.activeTabSelect(component, 'tab-sun');
    helper.clearContentShow(component);
    helper.showContent(component, 'content-sun');
  },
  clickTabGraph: function(component, event, helper) {
    helper.clearTabSelect(component);
    helper.activeTabSelect(component, 'tab-graph');
    helper.clearContentShow(component);
    helper.showContent(component, 'content-graph');
  },
})