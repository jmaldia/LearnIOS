//
//  DetailViewController.h
//  popoverapp
//
//  Created by Shawn Arney on 10/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property(nonatomic, readwrite) MKCoordinateRegion region;

@property(nonatomic, retain) IBOutlet MKMapView *mapView;

- (IBAction)handleTapFrom:(UITapGestureRecognizer *)recognizer;

@property(nonatomic, retain) UIPopoverController *popOverController;
@end
