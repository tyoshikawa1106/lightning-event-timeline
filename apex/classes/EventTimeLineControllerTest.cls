@isTest
private class EventTimeLineControllerTest {

	private static User testAdminUser = EventTimeLineTester.getLoginUser();
    
    /**
     * コンストラクタ
     */
    static testMethod void EventTimeLineControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            EventTimeLineController cls = new EventTimeLineController();
            
            Test.stopTest();
        }
    }

    /**
     * 今週の行動情報取得
     */
    static testMethod void getWeekEventsTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            EventTimeLineWeekWrapper result = EventTimeLineController.getWeekEvents();
            
            Test.stopTest();

            System.assertEquals(result.eventsByAll.isEmpty(), true);
            System.assertEquals(result.eventsByMonday.isEmpty(), true);
            System.assertEquals(result.eventsByTuesday.isEmpty(), true);
            System.assertEquals(result.eventsByWednesday.isEmpty(), true);
            System.assertEquals(result.eventsByThursday.isEmpty(), true);
            System.assertEquals(result.eventsByFriday.isEmpty(), true);
            System.assertEquals(result.eventsBySaturday.isEmpty(), true);
            System.assertEquals(result.eventsBySunday.isEmpty(), true);
        }
    }

    /**
     * 今週の行動情報取得
     */
    static testMethod void getWeekEventsTest2() {
        
        System.runAs(testAdminUser) {

            List<Event> events = new List<Event>();
            // Sun
            Event eventSun = EventTimeLineTester.createEvent(null, false);
            eventSun.ActivityDateTime = DateTime.newInstance(2015, 9, 20);
            events.add(eventSun);
            // Mon
            Event eventMon = EventTimeLineTester.createEvent(null, false);
            eventMon.ActivityDateTime = DateTime.newInstance(2015, 9, 21);
            events.add(eventMon);
            // Tue
            Event eventTue = EventTimeLineTester.createEvent(null, false);
            eventTue.ActivityDateTime = DateTime.newInstance(2015, 9, 22);
            events.add(eventTue);
            // Wed
            Event eventWed = EventTimeLineTester.createEvent(null, false);
            eventWed.ActivityDateTime = DateTime.newInstance(2015, 9, 23);
            events.add(eventWed);
            // Thu
            Event eventThu = EventTimeLineTester.createEvent(null, false);
            eventThu.ActivityDateTime = DateTime.newInstance(2015, 9, 24);
            events.add(eventThu);
            // Fri
            Event eventFri = EventTimeLineTester.createEvent(null, false);
            eventFri.ActivityDateTime = DateTime.newInstance(2015, 9, 25);
            events.add(eventFri);
            // Sat
            Event eventSat = EventTimeLineTester.createEvent(null, false);
            eventSat.ActivityDateTime = DateTime.newInstance(2015, 9, 26);
            events.add(eventSat);

            // INSERT
            insert events;

            Test.startTest();
            
            EventTimeLineWeekWrapper result = EventTimeLineController.getWeekEvents();
            
            Test.stopTest();

            System.assertEquals(result.eventsByAll.size(), 7);
            System.assertEquals(result.eventsByMonday.size(), 1);
            System.assertEquals(result.eventsByTuesday.size(), 1);
            System.assertEquals(result.eventsByWednesday.size(), 1);
            System.assertEquals(result.eventsByThursday.size(), 1);
            System.assertEquals(result.eventsByFriday.size(), 1);
            System.assertEquals(result.eventsBySaturday.size(), 1);
            System.assertEquals(result.eventsBySunday.size(), 1);
        }
    }

    /**
     * 行動の削除
     */
    static testMethod void doDeleteEventTest1() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, true);

            Test.startTest();
            
            Event result = EventTimeLineController.doDeleteEvent(event.Id);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();

            Integer results = [SELECT COUNT() FROM Event LIMIT 200];
            System.assertEquals(results, 0);
        }
    }

    /**
     * 行動の更新
     */
    static testMethod void doSaveEventTest1() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, true);
            String eventJson = '';

            Test.startTest();
            
            Event result = EventTimeLineController.doSaveEvent(eventJson);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 行動の更新
     */
    static testMethod void doSaveEventTest2() {
        
        System.runAs(testAdminUser) {
            // Event作成
            Event event = EventTimeLineTester.createEvent(null, true);
            // JSON生成
            JSONGenerator gen = JSON.createGenerator(true);
            gen.writeStartObject();
            gen.writeIdField('Id', event.Id);
            gen.writeStringField('Subject', 'Sample Subject');
            gen.writeStringField('Location', 'Sample Location');
            gen.writeStringField('Description', 'Sample Description');
            gen.writeEndObject();
            String eventJson = gen.getAsString();

            Test.startTest();
            
            Event result = EventTimeLineController.doSaveEvent(eventJson);
            System.assertEquals(result.Id, event.Id);
            System.assertEquals(result.Subject, 'Sample Subject');
            System.assertEquals(result.Location, 'Sample Location');
            System.assertEquals(result.Description, 'Sample Description');
            
            Test.stopTest();
        }
    }

    /**
     * 行動の更新
     */
    static testMethod void doSaveNewEventTest1() {
        
        System.runAs(testAdminUser) {

            Event event = EventTimeLineTester.createEvent(null, true);
            String eventJson = '';

            Test.startTest();
            
            Event result = EventTimeLineController.doSaveNewEvent(eventJson);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 行動の更新
     */
    static testMethod void doSaveNewEventTest2() {
        
        System.runAs(testAdminUser) {

            // JSON生成
            JSONGenerator gen = JSON.createGenerator(true);
            gen.writeStartObject();
            gen.writeStringField('subject', 'Sample Subject');
            gen.writeStringField('location', 'Sample Location');
            gen.writeStringField('description', 'Sample Description');
            gen.writeEndObject();
            String eventJson = gen.getAsString();

            Test.startTest();
            
            Event result = EventTimeLineController.doSaveNewEvent(eventJson);
            System.assertEquals(String.isNotEmpty(result.Id), true);
            System.assertEquals(result.Subject, 'Sample Subject');
            System.assertEquals(result.Location, 'Sample Location');
            System.assertEquals(result.Description, 'Sample Description');
            
            Test.stopTest();
        }
    }
}