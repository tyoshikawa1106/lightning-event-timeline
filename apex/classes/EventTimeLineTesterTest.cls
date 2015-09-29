@isTest
private class EventTimeLineTesterTest {

	private static User testAdminUser = EventTimeLineTester.getLoginUser();
    
    /**
     * Get LoginUser
     */
    static testMethod void getLoginUser() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            User result = EventTimeLineTester.getLoginUser();
            System.assertEquals(result.Id, UserInfo.getUserId());
            
            Test.stopTest();
        }
    }

    /**
     * 行動
     */
    static testMethod void createEventTest() {
        
        System.runAs(testAdminUser) {
            
            Test.startTest();
            
            // Insertなし
            Event event = EventTimeLineTester.createEvent(null, false);
            System.assertEquals(String.isEmpty(event.Id), true);
            
            // Insertあり
            event = EventTimeLineTester.createEvent(null, true);
            System.assertEquals(String.isNotEmpty(event.Id), true);
            
            Test.stopTest();
        }
    }
}