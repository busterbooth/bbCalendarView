bbCalendarView
==============

A functional gregorian calendar that works in iOS.

This project is a subclass of UIView that enables you to blackout dates, select a date, view a date, and goto today.

-It uses ARC and comes with an easy to customize .xib file.  
-The default implementation gets dates from a server and enables them.
-The server (if php) should give dates in the following manner:

<?php
	$dates=array();
	$dates=(
		"dates"=>[
		//array of dates in the format yyyy-mm-dd
		"2012-01-01",
		"2012-01-02",
		"2012-01-03"
	]); 
	echo json_encode($dates);
	exit();
?>
HOW TO USE (in XCode 4+):

Clone the git repository into your project source directory.

1. drag the .xcodeproject to your xcode project.
2. In your project:
	-Go to Target > Build Phases
3. Under the section "Target Dependencies", Add bbCalendarView.
4. Under the section "Link Binary With Libraries", add libbbCalendarView.a
5. In your project:
	-Go to Project > Build Settings
6. For "Header Search Paths" add $(SRCROOT)/bbCalendarView/bbCalendarView
	-Do the same for Target > Build Settings

7. in your project's view controller that needs a calendar:
	#import "bbCalendarView.h"
8. in bbCalendarView.m you can edit the function makeGallery, to have the calendar
do something when the user presses "View Day".
