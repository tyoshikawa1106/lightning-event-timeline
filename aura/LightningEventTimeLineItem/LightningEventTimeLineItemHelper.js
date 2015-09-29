({
  setup: function(component) {
    var svg_time_line_icon = component.find("svg_time_line_icon");
    var value_time_line_icon = svg_time_line_icon.getElement().innerText;
    value_time_line_icon = value_time_line_icon.replace("", "");
    svg_time_line_icon.getElement().innerHTML = value_time_line_icon;
    
    var svg_time_line_selectbox = component.find("svg_time_line_selectbox");
    var value_time_line_selectbox = svg_time_line_selectbox.getElement().innerText;
    value_time_line_selectbox = value_time_line_selectbox.replace("", "");
    svg_time_line_selectbox.getElement().innerHTML = value_time_line_selectbox;
    
    var svg_close_icon = component.find("svg_close_icon");
    var value_close_icon = svg_close_icon.getElement().innerText;
    value_close_icon = value_close_icon.replace("", "");
    svg_close_icon.getElement().innerHTML = value_close_icon;
  },
  openModal: function(component) {
    var elFormModal = component.find('form-modal');
    $A.util.addClass(elFormModal.getElement(), 'slds-show');
    $A.util.removeClass(elFormModal.getElement(), 'slds-hide');
  },
  closeModal: function(component) {
    var elFormModal = component.find('form-modal');
    $A.util.addClass(elFormModal.getElement(), 'slds-hide');
    $A.util.removeClass(elFormModal.getElement(), 'slds-show');
  },
  deleteEvent: function(component) {
    var action = component.get("c.doDeleteEvent");
    action.setParams({
      "eventId": component.get("v.event").Id
    });
    action.setCallback(this, function(data) {
      component.set("v.event", data.getReturnValue());
      this.refresh();
    });
    $A.enqueueAction(action);
  },
  saveEvent: function(component) {
    var action = component.get("c.doSaveEvent");
    action.setParams({
      "eventJson": JSON.stringify(component.get("v.event"))
    });
    action.setCallback(this, function(data) {
      component.set("v.event", data.getReturnValue());
      this.refresh();
    });
    $A.enqueueAction(action);
  },
  refresh: function() {
    var evt = $A.get("e.c:LightningEventTimeLineRefreshEvt");
    evt.fire();
  },
})