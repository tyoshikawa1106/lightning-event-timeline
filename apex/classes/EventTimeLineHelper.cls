public with sharing class EventTimeLineHelper {
	
    /**
     * コンストラクタ
     */
    public EventTimeLineHelper() {
		
	}

    /**
     * 基準日取得
     */
    public Date getBaseDate() {
        Date myDate = Date.today();
        if (Test.isRunningTest()) {
            myDate = Date.newInstance(2015, 9, 23);
        }

        return myDate;
    }

    /**
     * 曜日毎の行動情報取得
     */
    public EventTimeLineWeekWrapper getWeekEvents(List<Event> events) {
        EventTimeLineWeekWrapper weekEvents = new EventTimeLineWeekWrapper();

        // Add All
        weekEvents.eventsByAll.addAll(events);

        for (Event e : events) {
            if (String.isNotEmpty(e.DayOfWeekByStart__c)) {
                if (e.DayOfWeekByStart__c.equals('Mon')) {
                    weekEvents.eventsByMonday.add(e);
                } else if (e.DayOfWeekByStart__c.equals('Tue')) {
                    weekEvents.eventsByTuesday.add(e);
                } else if (e.DayOfWeekByStart__c.equals('Wed')) {
                    weekEvents.eventsByWednesday.add(e);
                } else if (e.DayOfWeekByStart__c.equals('Thu')) {
                    weekEvents.eventsByThursday.add(e);
                } else if (e.DayOfWeekByStart__c.equals('Fri')) {
                    weekEvents.eventsByFriday.add(e);
                } else if (e.DayOfWeekByStart__c.equals('Sat')) {
                    weekEvents.eventsBySaturday.add(e);
                } else if (e.DayOfWeekByStart__c.equals('Sun')) {
                    weekEvents.eventsBySunday.add(e);
                }
            }
        }

        return weekEvents;
    }

    /**
     * 更新用の値をセット
     */
    public Event setUpdateEvent(Event event, Map<String, Object> jsonMap) {
        event.Subject = (String)jsonMap.get('Subject');
        event.Location = (String)jsonMap.get('Location');
        event.Description = (String)jsonMap.get('Description');

        return event;
    }

    /**
     * 新規登録用の値をセット
     */
    public Event setNewEvent(Map<String, Object> jsonMap) {
        Event event = new Event(
             OwnerId = UserInfo.getUserId()
            ,Subject = (String)jsonMap.get('subject')
            ,Location = (String)jsonMap.get('location')
            ,Description = (String)jsonMap.get('description')
            ,DurationInMinutes = 1
            ,ActivityDateTime = datetime.now()
        );

        return event;
    }
}