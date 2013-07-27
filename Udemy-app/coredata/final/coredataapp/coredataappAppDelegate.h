//
//  coredataappAppDelegate.h
//  coredataapp
//
//  Created by Shawn Arney on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Book.h"
#import <CoreData/CoreData.h>

@interface coredataappAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;


@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
