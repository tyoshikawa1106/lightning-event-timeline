@isTest
private class EventTimeLineWeekWrapperTest {

    private static User testAdminUser = EventTimeLineTester.getLoginUser();
    
    /**
     * コンストラクタ
     */
    static testMethod void EventTimeLineWeekWrapperTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            EventTimeLineWeekWrapper cls = new EventTimeLineWeekWrapper();
            System.assertEquals(cls.eventsByAll.isEmpty(), true);
            System.assertEquals(cls.eventsByMonday.isEmpty(), true);
            System.assertEquals(cls.eventsByTuesday.isEmpty(), true);
            System.assertEquals(cls.eventsByWednesday.isEmpty(), true);
            System.assertEquals(cls.eventsByThursday.isEmpty(), true);
            System.assertEquals(cls.eventsByFriday.isEmpty(), true);
            System.assertEquals(cls.eventsBySaturday.isEmpty(), true);
            System.assertEquals(cls.eventsBySunday.isEmpty(), true);
            
            Test.stopTest();
        }
    }
}