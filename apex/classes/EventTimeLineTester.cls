public with sharing class EventTimeLineTester {

	/**
     * Get LoginUser
     */
    public static User getLoginUser() {
        return new User(Id = UserInfo.getUserId());
    }

    /**
     * 行動
     */
    public static Event createEvent(Id prmWhatId, Boolean isInsert) {
        
        Event event = new Event(
             OwnerId = UserInfo.getUserId()
            ,Subject = 'Email'
            ,WhatId = prmWhatId
            ,DurationInMinutes = 3
            ,ActivityDateTime = datetime.now()
        );
        
        if (isInsert) {
            insert event;
        }
        
        return event;
    }
}