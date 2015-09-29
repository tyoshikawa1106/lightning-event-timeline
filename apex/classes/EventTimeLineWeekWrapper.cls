public with sharing class EventTimeLineWeekWrapper {

    @AuraEnabled
    public List<Event> eventsByAll {get; set;}
    @AuraEnabled
    public List<Event> eventsByMonday {get; set;}
    @AuraEnabled
    public List<Event> eventsByTuesday {get; set;}
    @AuraEnabled
    public List<Event> eventsByWednesday {get; set;}
    @AuraEnabled
    public List<Event> eventsByThursday {get; set;}
    @AuraEnabled
    public List<Event> eventsByFriday {get; set;}
    @AuraEnabled
    public List<Event> eventsBySaturday {get; set;}
    @AuraEnabled
    public List<Event> eventsBySunday {get; set;}

    /**
     * コンストラクタ
     */
    public EventTimeLineWeekWrapper() {
        this.eventsByAll = new List<Event>();
        this.eventsByMonday = new List<Event>();
        this.eventsByTuesday = new List<Event>();
        this.eventsByWednesday = new List<Event>();
        this.eventsByThursday = new List<Event>();
        this.eventsByFriday = new List<Event>();
        this.eventsBySaturday = new List<Event>();
        this.eventsBySunday = new List<Event>();
    }
}