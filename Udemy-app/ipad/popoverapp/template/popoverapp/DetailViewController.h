//
//  DetailViewController.h
//  popoverapp
//
//  Created by Shawn Arney on 10/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)handleTapFrom:(UITapGestureRecognizer *)recognizer;

@property(nonatomic, readwrite) MKCoordinateRegion region;

@end
