//
//  MasterViewController.h
//  popoverapp
//
//  Created by Shawn Arney on 10/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (nonatomic, retain) NSArray *locations;
@property (nonatomic, retain) NSArray *regions;



@end
