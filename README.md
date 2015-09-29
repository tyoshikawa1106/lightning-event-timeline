# lightning-event-timeline
Lightning Component × Lightning Design System Sample Application

##Home
<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20150929/20150929174207.png" />

##Input Form
<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20150929/20150929173811.png" />

##Graph
<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20150929/20150929174050.png" />

##Activity Custom Fields
- Field Label: 曜日 (開始)
- API Name: DayOfWeekByStart__c

```
IF( 
ISNULL( ActivityDate ), 
"", 
CASE( MOD( ActivityDate - DATE(1900, 1, 7), 7 ), 
0, "Sun", 
1, "Mon", 
2, "Tue", 
3, "Wed", 
4, "Thu", 
5, "Fri", 
"Sat" 
) 
)
```
