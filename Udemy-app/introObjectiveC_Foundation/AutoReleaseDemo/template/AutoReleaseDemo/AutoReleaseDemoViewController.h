//
//  AutoReleaseDemoViewController.h
//  AutoReleaseDemo
//
//  Created by Shawn Arney on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoReleaseDemoViewController : UIViewController

- (void) testAutoRelease;
- (void) displayImage: (NSNumber *) x ;
- (void)displayImageComplete :(NSString *)animationID 

                     finished:(NSNumber *)finished 
                      context:(void *)context ;
- (NSString *) getString;
@end
