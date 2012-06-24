//
//  bbCalendarView.m
//  bbCalendarView
//
//  Created by Eddie Boswell on 6/24/12.
//  Copyright (c) 2012 The Buster Booth Company. All rights reserved.
//

#import "bbCalendarView.h"

@implementation bbCalendarView
@synthesize label,currentdate,selecteddate,gooddates,r1c1,r1c2,r1c3,r1c4,r1c5,r1c6,r1c7,r2c1,r2c2,r2c3,r2c4,r2c5,r2c6,r2c7,r3c1,r3c2,r3c3,r3c4,r3c5,r3c6,r3c7,r4c1,r4c2,r4c3,r4c4,r4c5,r4c6,r4c7,r5c1,r5c2,r5c3,r5c4,r5c5,r5c6,r5c7,r6c1,r6c2,r6c3,r6c4,r6c5,r6c6,r6c7;
-(void)setupMonth:(NSDate *)date{
    unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSWeekdayCalendarUnit;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:units fromDate:date];
    int days=0;
    switch([components month]){
        case JAN:
            days=JAN_DAYS;
        break;
        case FEB:
            if(([components year] % 4)==0){//leap year in feb has 29
                days=FEB_DAYS_LEAP;
            }else days=FEB_DAYS;
        break;
        case MAR:
            days=MAR_DAYS;
        break;
        case APR:
            days=APR_DAYS;
        break;
        case MAY:
            days=MAY_DAYS;
        break;
        case JUN:
            days=JUN_DAYS;
        break;
        case JUL:
            days=JUL_DAYS;
        break;
        case AUG:
            days=AUG_DAYS;
        break;
        case SEP:
            days=SEP_DAYS;
        break;
        case OCT:
            days=OCT_DAYS;
        break;
        case NOV:
            days=NOV_DAYS;
        break;
        case DEC:
            days=DEC_DAYS;
        break;
    }
    //position inital day at the button with the same tag as the day up to +7
    int initial_day_of_week = ([components day] % 7);
    int start_day = [components day];
    int delta=0;
    if(initial_day_of_week == 0){
        initial_day_of_week = 7;
    }
    if(initial_day_of_week != [components weekday]){
        if(initial_day_of_week < [components weekday]){
            delta=([components weekday] - initial_day_of_week);
        }else{
            delta=((7-initial_day_of_week)+[components weekday]);
        }
    }
    start_day+=delta;
    days+=delta;
    current_day_delta=delta;
    UIButton *button=nil;
    for(int i=1;i<=42;i++){
        button=(UIButton*)[self viewWithTag:i];
        [button setBackgroundColor:[UIColor clearColor]];
        [button setTitle:@"" forState:UIControlStateNormal];
        [button setEnabled:NO];
    }
    //days after today
    for(int i=start_day;i<=days;i++){
        if(i<1 || i>42){
            break;
        }
        button=(UIButton*)[self viewWithTag:i];
        [button setTitle:[NSString stringWithFormat:@"%d",i-delta] forState:UIControlStateNormal];
    }
    //days before today
    for(int i=start_day-1;i>delta;i--){
        if(i<1 || i>42){
            break;
        }
        button=(UIButton*)[self viewWithTag:i];
        [button setTitle:[NSString stringWithFormat:@"%d",i-delta] forState:UIControlStateNormal];
    }
    [self.label setTitle:[NSString stringWithFormat:@"%@ %d",[self monthString:[components month]],[components year]]];
    current_year=[components year];
    current_month=[components month];
    [self enableDates];
}
-(NSString *)monthString:(int)month{
    switch(month){
        case JAN:
            return @"Jan";
        break;
        case FEB:
            return @"Feb";        
        break;
        case MAR:
            return @"Mar";        
        break;
        case APR:
            return @"Apr";        
        break;
        case MAY:
            return @"May";
        break;
        case JUN:
            return @"Jun";
        break;
        case JUL:
            return @"Jul";
        break;
        case AUG:
            return @"Aug";
        break;
        case SEP:
            return @"Sep";
        break;
        case OCT:
            return @"Oct";
        break;
        case NOV:
            return @"Nov";
        break;
        case DEC:
            return @"Dec";
        break;
    }
    return @"(null)";
}
-(IBAction)makeGallery{
    //use this function to do what you need to do when the user presses 'View Day'
}
-(IBAction)nextMonth:(id)sender{
    [self setDelta:[self getDelta] + 1];
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:[self getDelta]];
    NSDate *oneMonthAgo = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    [self setupMonth:oneMonthAgo];
}
-(IBAction)lastMonth:(id)sender{
    [self setDelta:[self getDelta] - 1];
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:[self getDelta]];
    NSDate *oneMonthAgo = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    [self setupMonth:oneMonthAgo];
}
-(IBAction)selectDate:(UIButton *)sender{
    UIButton *button=nil;
    for(int i=1;i<=42;i++){
        button=(UIButton*)[self viewWithTag:i];
       [button setBackgroundColor:[UIColor clearColor]];
    }
    [sender setBackgroundColor:[UIColor whiteColor]];
    self.selecteddate = [NSString stringWithFormat:@"%d-%d-%@",current_year,current_month,[[sender titleLabel] text]];
}
-(int)getDelta{
    return month_delta;
}
-(void)setDelta:(int)value{
    month_delta=value;
}
-(IBAction)today:(id)sender{
    [self setDelta:0];
    [self setupMonth:currentdate];
}
-(void)getGoodDates{
@autoreleasepool {
    NSURL *requestURL =[NSURL URLWithString:[NSString stringWithFormat:@"%@",DATES_URL]];
//    NSData *requestData = [[NSString stringWithFormat:@"q=%d",DATES] dataUsingEncoding: NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:requestData];
    NSError *e=nil;
    NSData *returnData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&e];
    if(returnData == nil){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No network connection" 
                                                message:@"You must be connected to the internet to use this app." 
                                               delegate:nil 
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [alert show];
        return;
    }
    NSError *jsonParsingError = nil;
    NSDictionary *userdata = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:&jsonParsingError];
    for (NSString* key in userdata) {
        if ([key hasPrefix:@"dates"]) {
        self.gooddates=[userdata objectForKey:key];
        break;
        }
    }
    [self enableDates];
}
}
-(void)enableDates{
    if(self.gooddates == nil){
        return;
    }
    unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = nil;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = nil;
    UIButton *button=nil;
    for (NSString *key in self.gooddates){
        date=[dateFormatter dateFromString:key];
        components=[gregorian components:units fromDate:date];
        if(([components month] == current_month)&&([components year]==current_year)){
            button=(UIButton*)[self viewWithTag:([components day]+current_day_delta)];
            [button setEnabled:YES];
        }
    }
}
@end
