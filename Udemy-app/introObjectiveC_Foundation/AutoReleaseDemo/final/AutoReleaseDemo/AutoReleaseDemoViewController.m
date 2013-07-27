//
//  AutoReleaseDemoViewController.m
//  AutoReleaseDemo
//
//  Created by Shawn Arney on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AutoReleaseDemoViewController.h"

@implementation AutoReleaseDemoViewController


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (NSString *) getString
{
    NSString *temp = [[[NSString alloc] initWithString:@"My temp"] autorelease] ;
    
    return temp;
    
   // [temp release];
}

- (void) testAutoRelease
{
    NSString *tempp = [self getString];
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    for (int i = 0; i < 30; i++)
    {
        NSNumber *x = [[NSNumber alloc] initWithInt:i *20];
        
        NSString *temp = [[[NSString alloc ] initWithFormat:@"new image #%i ", i+1] autorelease]; // multiple temp objects (with autorelease)
        
        NSLog(@"%@",temp);
        
        [self displayImage:x];
        [x release];
    }
    
    [pool drain]; // USE drain or release
    
    //[pool release];
    
    
}

- (void) displayImage: (NSNumber *) x 
{

    UIImageView* imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cardinal.png"]] ;
    
    imgView.frame =CGRectMake([x intValue] * 1.6, 500.0, 0, 0);
    
    [self.view addSubview:imgView];
    
    [UIView beginAnimations:nil context:imgView];
    
    [UIView setAnimationDuration:12]; // image speed
    
    imgView.frame =  CGRectMake([x intValue]+30, -50, 200, 200); // move and make image bigger
    
    [UIView setAnimationDidStopSelector:@selector(displayImageComplete:finished:context:)]; // cleanup
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    [imgView release]; // release from memory
}

- (void)displayImageComplete :(NSString *)animationID 

                     finished:(NSNumber *)finished 
                      context:(void *)context 

{    
    
    UIImageView *imgView = context;
    
  [imgView removeFromSuperview]; // remove image from view; done
}


#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self testAutoRelease];
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
