@isTest
private class EventTimeLineDaoTest {

    private static EventTimeLineDao dao = new EventTimeLineDao();
    private static User testAdminUser = EventTimeLineTester.getLoginUser();
    
    /**
     * 行動情報取得
     */
    static testMethod void getEventsTest1() {
        
        System.runAs(testAdminUser) {

            Date weekStart = null;
            Date weekEnd = null;

            Test.startTest();
            
            List<Event> results = dao.getEvents(weekStart, weekEnd);
            System.assertEquals(results.isEmpty(), true);
            
            Test.stopTest();
        }
    }

    /**
     * 行動情報取得
     */
    static testMethod void getEventsTest2() {
        
        System.runAs(testAdminUser) {

            Date weekStart = System.today();
            Date weekEnd = System.today();
            Event event = EventTimeLineTester.createEvent(null, true);

            Test.startTest();
            
            List<Event> results = dao.getEvents(weekStart, weekEnd);
            System.assertEquals(results.size(), 1);
            
            Test.stopTest();
        }
    }

    /**
     * 行動情報取得
     */
    static testMethod void getEventTest1() {
        
        System.runAs(testAdminUser) {

            Id eventId = null;

            Test.startTest();
            
            Event result = dao.getEvent(eventId);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 行動情報取得
     */
    static testMethod void getEventTest2() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, true);
            Id eventId = event.Id;

            Test.startTest();
            
            Event result = dao.getEvent(eventId);
            System.assertEquals(String.isNotEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }
}