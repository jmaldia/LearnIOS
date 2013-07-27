//
//  ApplicationDemoAppDelegate.h
//  ApplicationDemo
//
//  Created by Shawn Arney on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplicationDemoViewController;

@interface ApplicationDemoAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ApplicationDemoViewController *viewController;

@end
