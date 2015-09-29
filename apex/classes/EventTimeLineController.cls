public with sharing class EventTimeLineController {

    private static EventTimeLineHelper helper = new EventTimeLineHelper();
    private static EventTimeLineDao dao = new EventTimeLineDao();

    /**
     * コンストラクタ
     */
    public EventTimeLineController() {
        
    }

    /**
     * 今週の行動情報取得
     */
    @AuraEnabled
    public static EventTimeLineWeekWrapper getWeekEvents() {

        // 初期化
        EventTimeLineWeekWrapper weekEvents = new EventTimeLineWeekWrapper();

        // 週初日と週末日を取得
        Date myDate = helper.getBaseDate();
        Date weekStart = myDate.toStartofWeek();
        Date weekEnd = weekStart.addDays(6);

        // 今週の行動情報取得
        List<Event> events = dao.getEvents(weekStart, weekEnd);
        // リスト件数判定
        if (events.isEmpty()) return weekEvents;

        // 行動情報を曜日毎のリストにセット
        weekEvents = helper.getWeekEvents(events);

        return weekEvents;
    }

    /**
     * 行動の削除
     */
    @AuraEnabled
    public static Event doDeleteEvent(Id eventId) {
        delete dao.getEvent(eventId);
        return new Event();
    }

    /**
     * 行動の登録(更新)
     */
    @AuraEnabled
    public static Event doSaveEvent(String eventJson) {
        // 文字列存在判定
        if (String.isEmpty(eventJson)) return new Event();
        // JSON → Map
        Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(eventJson);
        // IDを取得
        Id eventId = (String)jsonMap.get('Id');
        // IDを判定
        if (eventId == null) return new Event();

        // IDを条件に値を取得
        Event event = dao.getEvent(eventId);
        // 値をセット
        event = helper.setUpdateEvent(event, jsonMap);
        // Update
        update event;

        return event;
    }

    /**
     * 行動の登録(新規)
     */
    @AuraEnabled
    public static Event doSaveNewEvent(String eventJson) {
        
        // 文字列存在判定
        if (String.isEmpty(eventJson)) return new Event();
        // JSON → Map
        Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(eventJson);

        // 値をセット
        Event event = helper.setNewEvent(jsonMap);
        // INSERT
        insert event;

        return event;
    }
}