#Time measurement tool for performance dubugging in Cocoa

##How to use

1st

Import KKMeasureTimeLogger.h and KKMeasureTimeLogger.m files into your project.

2nd

write codes

```objective-c
//initialize and start a measurement
[KKMeasureTimeLogger startWithLogMode:KKMeasureTimeLogModeAfter];

//lap
[KKMeasureTimeLogger lap:@"You can write a messsage as you like"];

//stop
[KKMeasureTimeLogger stop];
```

3rd

in Log panel, you can see like this …

```objective-c
From start 0.000014 sec. From last lap 0.000004 sec <= button tapped in master view
From start 0.001058 sec. From last lap 0.001044 sec <= detail view did load
From start 0.001190 sec. From last lap 0.000132 sec <= detail view view will appear
From start 0.355751 sec. From last lap 0.354561 sec <= detail view view did appear
```

That's it.


##note

As NSLog method consume not ignore time, you may have to use KKMeasureTimeLogModeAfter mode.

##License

MIT license



