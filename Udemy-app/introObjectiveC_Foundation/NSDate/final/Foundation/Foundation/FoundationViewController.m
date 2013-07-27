//
//  FoundationViewController.m
//  Foundation
//
//  Created by Shawn Arney on 9/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FoundationViewController.h"

@implementation FoundationViewController

@synthesize dayOfWeekLabel;

- (void) dealloc
{
    [dayOfWeekLabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDate *dateToday = [NSDate date]; // today's date
    
    // MINUS one day i.e. (60 seconds in minute * 60 minutes in hour * 24 hours)
    NSDate *dateYesterday = [dateToday dateByAddingTimeInterval:-(60 * 60 *24)];  //interval is in seconds 
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    dateFormat.dateStyle = NSDateFormatterMediumStyle; // change this constant to vary style of date
    dateFormat.timeStyle = NSDateFormatterShortStyle;

    
    dayOfWeekLabel.text = [NSString stringWithFormat:@"today: %@ \ryesterday: %@", 
                                            [dateFormat stringFromDate:dateToday], 
                                            [dateFormat stringFromDate:dateYesterday]];
    
    
    [dateFormat release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
