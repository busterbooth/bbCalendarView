//
//  bbHomeViewController.h
//  BusterBooth
//
//  Created by Eddie Boswell on 5/16/12.
//  Copyright (c) 2012 The Buster Booth Company. All rights reserved.
//
//days
#define SUNDAY 1
#define MONDAY 2
#define TUESDAY 3
#define WEDNESDAY 4
#define THURSDAY 5
#define FRIDAY 6
#define SATURDAY 7
//months
#define JAN 1
#define FEB 2
#define MAR 3
#define APR 4
#define MAY 5
#define JUN 6
#define JUL 7
#define AUG 8
#define SEP 9
#define OCT 10
#define NOV 11
#define DEC 12
//amount of days
#define JAN_DAYS 31
#define FEB_DAYS 28
#define MAR_DAYS 31
#define APR_DAYS 30
#define MAY_DAYS 31
#define JUN_DAYS 30
#define JUL_DAYS 31
#define AUG_DAYS 31
#define SEP_DAYS 30
#define OCT_DAYS 31
#define NOV_DAYS 30
#define DEC_DAYS 31
//special
#define FEB_DAYS_LEAP 29

//url to get json array of dates from a server in the format
//{"dates" : ["yyyy-mm-dd", "..."]}

#define DATES_URL @"your_url_here"

#import <UIKit/UIKit.h>
@interface bbCalendarView : UIView
{
//iterator
    int month_delta;
    int current_day_delta;
    int current_month;
    int current_year;
}
//dates
@property (nonatomic,retain) NSDate *currentdate;
@property (nonatomic,retain) NSString *selecteddate;
@property (nonatomic,retain) NSArray *gooddates;
//row 1
@property (nonatomic,retain) IBOutlet UIButton *r1c1;
@property (nonatomic,retain) IBOutlet UIButton *r1c2;
@property (nonatomic,retain) IBOutlet UIButton *r1c3;
@property (nonatomic,retain) IBOutlet UIButton *r1c4;
@property (nonatomic,retain) IBOutlet UIButton *r1c5;
@property (nonatomic,retain) IBOutlet UIButton *r1c6;
@property (nonatomic,retain) IBOutlet UIButton *r1c7;
//row 2
@property (nonatomic,retain) IBOutlet UIButton *r2c1;
@property (nonatomic,retain) IBOutlet UIButton *r2c2;
@property (nonatomic,retain) IBOutlet UIButton *r2c3;
@property (nonatomic,retain) IBOutlet UIButton *r2c4;
@property (nonatomic,retain) IBOutlet UIButton *r2c5;
@property (nonatomic,retain) IBOutlet UIButton *r2c6;
@property (nonatomic,retain) IBOutlet UIButton *r2c7;
//row 3
@property (nonatomic,retain) IBOutlet UIButton *r3c1;
@property (nonatomic,retain) IBOutlet UIButton *r3c2;
@property (nonatomic,retain) IBOutlet UIButton *r3c3;
@property (nonatomic,retain) IBOutlet UIButton *r3c4;
@property (nonatomic,retain) IBOutlet UIButton *r3c5;
@property (nonatomic,retain) IBOutlet UIButton *r3c6;
@property (nonatomic,retain) IBOutlet UIButton *r3c7;
//row 4
@property (nonatomic,retain) IBOutlet UIButton *r4c1;
@property (nonatomic,retain) IBOutlet UIButton *r4c2;
@property (nonatomic,retain) IBOutlet UIButton *r4c3;
@property (nonatomic,retain) IBOutlet UIButton *r4c4;
@property (nonatomic,retain) IBOutlet UIButton *r4c5;
@property (nonatomic,retain) IBOutlet UIButton *r4c6;
@property (nonatomic,retain) IBOutlet UIButton *r4c7;
//row 5
@property (nonatomic,retain) IBOutlet UIButton *r5c1;
@property (nonatomic,retain) IBOutlet UIButton *r5c2;
@property (nonatomic,retain) IBOutlet UIButton *r5c3;
@property (nonatomic,retain) IBOutlet UIButton *r5c4;
@property (nonatomic,retain) IBOutlet UIButton *r5c5;
@property (nonatomic,retain) IBOutlet UIButton *r5c6;
@property (nonatomic,retain) IBOutlet UIButton *r5c7;
//row 6
@property (nonatomic,retain) IBOutlet UIButton *r6c1;
@property (nonatomic,retain) IBOutlet UIButton *r6c2;
@property (nonatomic,retain) IBOutlet UIButton *r6c3;
@property (nonatomic,retain) IBOutlet UIButton *r6c4;
@property (nonatomic,retain) IBOutlet UIButton *r6c5;
@property (nonatomic,retain) IBOutlet UIButton *r6c6;
@property (nonatomic,retain) IBOutlet UIButton *r6c7;

//label
@property (nonatomic,retain) IBOutlet UINavigationItem *label;
-(void)setupMonth:(NSDate *)date;
-(IBAction)nextMonth:(id)sender;
-(IBAction)lastMonth:(id)sender;
-(IBAction)selectDate:(UIButton *)sender;
-(NSString *)monthString:(int)month;
-(int)getDelta;
-(void)setDelta:(int)value;
-(IBAction)makeGallery;
-(IBAction)today:(UIButton *)sender;
-(void)getGoodDates;
-(void)enableDates;
@end