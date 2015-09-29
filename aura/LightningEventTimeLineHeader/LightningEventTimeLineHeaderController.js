({
  openNewFormModal: function(component, event, helper) {
    helper.openModal(component);
  },
  closeNewFormModal: function(component, event, helper) {
    helper.closeModal(component);
  },
  saveEvent: function(component, event, helper) {
    helper.saveEvent(component);
    helper.closeModal(component);
  },
})