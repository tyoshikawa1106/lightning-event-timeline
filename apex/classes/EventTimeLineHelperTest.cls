@isTest
private class EventTimeLineHelperTest {

    private static EventTimeLineHelper helper = new EventTimeLineHelper();
    private static User testAdminUser = EventTimeLineTester.getLoginUser();

    /**
     * 基準日取得
     */
    static testMethod void getBaseDateTest1() {
        
        System.runAs(testAdminUser) {

            List<Event> events = new List<Event>();

            Test.startTest();
            
            Date result = helper.getBaseDate();
            System.assertEquals(result, Date.newInstance(2015, 9, 23));

            Date weekStart = result.toStartofWeek();
            Date weekEnd = weekStart.addDays(6);
            System.assertEquals(weekStart, Date.newInstance(2015, 9, 20));
            System.assertEquals(weekEnd, Date.newInstance(2015, 9, 26));
            
            Test.stopTest();
        }
    }
    
    /**
     * 行動情報取得
     */
    static testMethod void getWeekEventsTest1() {
        
        System.runAs(testAdminUser) {

            List<Event> events = new List<Event>();

            Test.startTest();
            
            EventTimeLineWeekWrapper result = helper.getWeekEvents(events);
            System.assertEquals(result.eventsByAll.isEmpty(), true);
            System.assertEquals(result.eventsByMonday.isEmpty(), true);
            System.assertEquals(result.eventsByTuesday.isEmpty(), true);
            System.assertEquals(result.eventsByWednesday.isEmpty(), true);
            System.assertEquals(result.eventsByThursday.isEmpty(), true);
            System.assertEquals(result.eventsByFriday.isEmpty(), true);
            System.assertEquals(result.eventsBySaturday.isEmpty(), true);
            System.assertEquals(result.eventsBySunday.isEmpty(), true);
            
            Test.stopTest();
        }
    }

    /**
     * 行動情報取得(Sun)
     */
    static testMethod void getWeekEventsTest2() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, false);
            event.ActivityDateTime = DateTime.newInstance(2015, 9, 20);
            insert event;

            Event resultEvent = [SELECT Id, DayOfWeekByStart__c FROM Event WHERE Id =: event.Id LIMIT 1];
            System.assertEquals(resultEvent.DayOfWeekByStart__c, 'Sun');

            List<Event> events = new List<Event>();
            events.add(resultEvent);

            Test.startTest();
            
            EventTimeLineWeekWrapper result = helper.getWeekEvents(events);
            System.assertEquals(result.eventsByAll.size(), 1);
            System.assertEquals(result.eventsBySunday.size(), 1);
            System.assertEquals(result.eventsByMonday.size(), 0);
            System.assertEquals(result.eventsByTuesday.size(), 0);
            System.assertEquals(result.eventsByWednesday.size(), 0);
            System.assertEquals(result.eventsByThursday.size(), 0);
            System.assertEquals(result.eventsByFriday.size(), 0);
            System.assertEquals(result.eventsBySaturday.size(), 0);
            
            Test.stopTest();
        }
    }

    /**
     * 行動情報取得(Mon)
     */
    static testMethod void getWeekEventsTest3() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, false);
            event.ActivityDateTime = DateTime.newInstance(2015, 9, 21);
            insert event;

            Event resultEvent = [SELECT Id, DayOfWeekByStart__c FROM Event WHERE Id =: event.Id LIMIT 1];
            System.assertEquals(resultEvent.DayOfWeekByStart__c, 'Mon');

            List<Event> events = new List<Event>();
            events.add(resultEvent);

            Test.startTest();
            
            EventTimeLineWeekWrapper result = helper.getWeekEvents(events);
            System.assertEquals(result.eventsByAll.size(), 1);
            System.assertEquals(result.eventsBySunday.size(), 0);
            System.assertEquals(result.eventsByMonday.size(), 1);
            System.assertEquals(result.eventsByTuesday.size(), 0);
            System.assertEquals(result.eventsByWednesday.size(), 0);
            System.assertEquals(result.eventsByThursday.size(), 0);
            System.assertEquals(result.eventsByFriday.size(), 0);
            System.assertEquals(result.eventsBySaturday.size(), 0);
            
            Test.stopTest();
        }
    }

    /**
     * 行動情報取得(Tue)
     */
    static testMethod void getWeekEventsTest4() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, false);
            event.ActivityDateTime = DateTime.newInstance(2015, 9, 22);
            insert event;

            Event resultEvent = [SELECT Id, DayOfWeekByStart__c FROM Event WHERE Id =: event.Id LIMIT 1];
            System.assertEquals(resultEvent.DayOfWeekByStart__c, 'Tue');

            List<Event> events = new List<Event>();
            events.add(resultEvent);

            Test.startTest();
            
            EventTimeLineWeekWrapper result = helper.getWeekEvents(events);
            System.assertEquals(result.eventsByAll.size(), 1);
            System.assertEquals(result.eventsBySunday.size(), 0);
            System.assertEquals(result.eventsByMonday.size(), 0);
            System.assertEquals(result.eventsByTuesday.size(), 1);
            System.assertEquals(result.eventsByWednesday.size(), 0);
            System.assertEquals(result.eventsByThursday.size(), 0);
            System.assertEquals(result.eventsByFriday.size(), 0);
            System.assertEquals(result.eventsBySaturday.size(), 0);
            
            Test.stopTest();
        }
    }

    /**
     * 行動情報取得(Wed)
     */
    static testMethod void getWeekEventsTest5() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, false);
            event.ActivityDateTime = DateTime.newInstance(2015, 9, 23);
            insert event;

            Event resultEvent = [SELECT Id, DayOfWeekByStart__c FROM Event WHERE Id =: event.Id LIMIT 1];
            System.assertEquals(resultEvent.DayOfWeekByStart__c, 'Wed');

            List<Event> events = new List<Event>();
            events.add(resultEvent);

            Test.startTest();
            
            EventTimeLineWeekWrapper result = helper.getWeekEvents(events);
            System.assertEquals(result.eventsByAll.size(), 1);
            System.assertEquals(result.eventsBySunday.size(), 0);
            System.assertEquals(result.eventsByMonday.size(), 0);
            System.assertEquals(result.eventsByTuesday.size(), 0);
            System.assertEquals(result.eventsByWednesday.size(), 1);
            System.assertEquals(result.eventsByThursday.size(), 0);
            System.assertEquals(result.eventsByFriday.size(), 0);
            System.assertEquals(result.eventsBySaturday.size(), 0);
            
            Test.stopTest();
        }
    }

    /**
     * 行動情報取得(Thu)
     */
    static testMethod void getWeekEventsTest6() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, false);
            event.ActivityDateTime = DateTime.newInstance(2015, 9, 24);
            insert event;

            Event resultEvent = [SELECT Id, DayOfWeekByStart__c FROM Event WHERE Id =: event.Id LIMIT 1];
            System.assertEquals(resultEvent.DayOfWeekByStart__c, 'Thu');

            List<Event> events = new List<Event>();
            events.add(resultEvent);

            Test.startTest();
            
            EventTimeLineWeekWrapper result = helper.getWeekEvents(events);
            System.assertEquals(result.eventsByAll.size(), 1);
            System.assertEquals(result.eventsBySunday.size(), 0);
            System.assertEquals(result.eventsByMonday.size(), 0);
            System.assertEquals(result.eventsByTuesday.size(), 0);
            System.assertEquals(result.eventsByWednesday.size(), 0);
            System.assertEquals(result.eventsByThursday.size(), 1);
            System.assertEquals(result.eventsByFriday.size(), 0);
            System.assertEquals(result.eventsBySaturday.size(), 0);
            
            Test.stopTest();
        }
    }

    /**
     * 行動情報取得(Fri)
     */
    static testMethod void getWeekEventsTest7() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, false);
            event.ActivityDateTime = DateTime.newInstance(2015, 9, 25);
            insert event;

            Event resultEvent = [SELECT Id, DayOfWeekByStart__c FROM Event WHERE Id =: event.Id LIMIT 1];
            System.assertEquals(resultEvent.DayOfWeekByStart__c, 'Fri');

            List<Event> events = new List<Event>();
            events.add(resultEvent);

            Test.startTest();
            
            EventTimeLineWeekWrapper result = helper.getWeekEvents(events);
            System.assertEquals(result.eventsByAll.size(), 1);
            System.assertEquals(result.eventsBySunday.size(), 0);
            System.assertEquals(result.eventsByMonday.size(), 0);
            System.assertEquals(result.eventsByTuesday.size(), 0);
            System.assertEquals(result.eventsByWednesday.size(), 0);
            System.assertEquals(result.eventsByThursday.size(), 0);
            System.assertEquals(result.eventsByFriday.size(), 1);
            System.assertEquals(result.eventsBySaturday.size(), 0);
            
            Test.stopTest();
        }
    }

    /**
     * 行動情報取得(Sat)
     */
    static testMethod void getWeekEventsTest8() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, false);
            event.ActivityDateTime = DateTime.newInstance(2015, 9, 26);
            insert event;

            Event resultEvent = [SELECT Id, DayOfWeekByStart__c FROM Event WHERE Id =: event.Id LIMIT 1];
            System.assertEquals(resultEvent.DayOfWeekByStart__c, 'Sat');

            List<Event> events = new List<Event>();
            events.add(resultEvent);

            Test.startTest();
            
            EventTimeLineWeekWrapper result = helper.getWeekEvents(events);
            System.assertEquals(result.eventsByAll.size(), 1);
            System.assertEquals(result.eventsBySunday.size(), 0);
            System.assertEquals(result.eventsByMonday.size(), 0);
            System.assertEquals(result.eventsByTuesday.size(), 0);
            System.assertEquals(result.eventsByWednesday.size(), 0);
            System.assertEquals(result.eventsByThursday.size(), 0);
            System.assertEquals(result.eventsByFriday.size(), 0);
            System.assertEquals(result.eventsBySaturday.size(), 1);
            
            Test.stopTest();
        }
    }

    /**
     * 更新用の値をセット
     */
    static testMethod void setUpdateEventTest1() {
        
        System.runAs(testAdminUser) {

            Event event = new Event();
            Map<String, Object> jsonMap = new Map<String, Object>();

            Test.startTest();
            
            Event result = helper.setUpdateEvent(event, jsonMap);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 新規登録用の値をセット
     */
    static testMethod void setNewEventTest1() {
        
        System.runAs(testAdminUser) {

            Map<String, Object> jsonMap = new Map<String, Object>();

            Test.startTest();
            
            Event result = helper.setNewEvent(jsonMap);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }
}