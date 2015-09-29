public with sharing class EventTimeLineDao {

    /**
     * コンストラクタ
     */
	public EventTimeLineDao() {
		
	}

    /**
     * 行動情報取得
     */
    public List<Event> getEvents(Date weekStart, Date weekEnd) {
        return [
            SELECT
                 Id
                ,Subject
                ,StartDateTime
                ,EndDateTime
                ,Location
                ,Description
                ,Owner.Name
                ,ActivityDate
                ,DayOfWeekByStart__c
            FROM
                Event
            WHERE
                OwnerId =: UserInfo.getUserId()
            AND
                ActivityDate >=: weekStart
            AND
                ActivityDate <=: weekEnd
            ORDER BY StartDateTime ASC
            LIMIT 200
        ];
    }

    /**
     * 行動情報取得
     */
    public Event getEvent(Id eventId) {
        List<Event> events = [
            SELECT
                 Id
                ,Subject
                ,StartDateTime
                ,EndDateTime
                ,Location
                ,Description
                ,Owner.Name
                ,ActivityDate
                ,DayOfWeekByStart__c
            FROM
                Event
            WHERE
                Id =: eventId
            LIMIT 1
        ];

        return events.isEmpty() ? new Event() : events[0];
    }
}