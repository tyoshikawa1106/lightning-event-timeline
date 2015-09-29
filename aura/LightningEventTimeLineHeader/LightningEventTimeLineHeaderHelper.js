({
  setup: function(component) {
    var svg_title_icon = component.find("svg_title_icon");
    var value_title_icon = svg_title_icon.getElement().innerText;
    value_title_icon = value_title_icon.replace("", "");
    svg_title_icon.getElement().innerHTML = value_title_icon;
    
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
  saveEvent: function(component) {
    var subject = component.get("v.subject");
    var location = component.get("v.location");
    var description = component.get("v.description");

    var obj = {
      subject: subject,
      location: location,
      description: description
    };
  
    var action = component.get("c.doSaveNewEvent");
    action.setParams({
      "eventJson": JSON.stringify(obj)
    });
    action.setCallback(this, function(data) {
      component.set("v.subject", "");
      component.set("v.location", "");
      component.set("v.description", "");
      this.refresh();
      console.log('Apex!');
    });
    $A.enqueueAction(action);
  },
  refresh: function() {
    var evt = $A.get("e.c:LightningEventTimeLineRefreshEvt");
    evt.fire();
  },
})