//
//  SecondViewController.h
//  coredataapp
//
//  Created by Shawn Arney on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Book.h"
#import <CoreData/CoreData.h>

@interface SecondViewController : UITableViewController 

@property (nonatomic, retain) NSMutableArray * books;



- (IBAction)deleteTouched:(id)sender;

@end
