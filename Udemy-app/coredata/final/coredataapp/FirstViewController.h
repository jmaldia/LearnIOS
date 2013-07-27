//
//  FirstViewController.h
//  coredataapp
//
//  Created by Shawn Arney on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UITableViewController
    - (void) searchAppsByKeyword: (NSString *) keyword;

@property (nonatomic, retain) NSMutableArray * books;

- (IBAction)favoriteTouched:(id)sender;

@end
