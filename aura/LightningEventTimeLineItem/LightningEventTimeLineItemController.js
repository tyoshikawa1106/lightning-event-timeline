({
	deleteEvent: function(component, event, helper) {
    if (confirm('Are you Sure?')) {
      helper.deleteEvent(component);
    }
	},
  openEditFormModal: function(component, event, helper) {
    helper.openModal(component);
  },
  closeEditFormModal: function(component, event, helper) {
    helper.closeModal(component);
  },
  saveEvent: function(component, event, helper) {
    helper.saveEvent(component);
    helper.closeModal(component);
  },
})