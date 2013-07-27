//
//  AutoReleaseDemoAppDelegate.h
//  AutoReleaseDemo
//
//  Created by Shawn Arney on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AutoReleaseDemoViewController;

@interface AutoReleaseDemoAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet AutoReleaseDemoViewController *viewController;

@end
