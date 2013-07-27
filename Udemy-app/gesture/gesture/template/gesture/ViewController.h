//
//  ViewController.h
//  gesture
//
//  Created by Shawn Arney on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property(nonatomic, retain) IBOutlet UIImageView * turtle;
@property(nonatomic, retain) IBOutlet UIImageView * whale;
@property(nonatomic, retain) IBOutlet UIImageView * jellyfish;
@property(nonatomic, retain) IBOutlet UIImageView * starfish1;
@property(nonatomic, retain) IBOutlet UIImageView * starfish2;
@property(nonatomic, retain) IBOutlet UIImageView * starfish3;

@property (nonatomic, readwrite) double speed;
@property (nonatomic, readwrite) BOOL swipeLeft;

- (void)onTimer;

- (IBAction)handleTapFrom:(UITapGestureRecognizer *)recognizer;

- (IBAction)handleSwipeFromLeft:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)handleSwipeFromRight:(UISwipeGestureRecognizer *)recognizer;

@end
