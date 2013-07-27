//
//  ViewController.m
//  gesture
//
//  Created by Shawn Arney on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize turtle;
@synthesize whale;
@synthesize jellyfish;
@synthesize starfish1;
@synthesize starfish2;
@synthesize starfish3;
@synthesize speed;
@synthesize swipeLeft;

- (void) dealloc
{
    [turtle release];
    [whale release];
    [jellyfish release];
    [starfish1 release];
    [starfish2 release];
    [starfish3 release];
    
}

/*
 In response to a tap gesture, show the image view appropriately then make it fade out in place.
 */
- (IBAction)handleTapFrom:(UITapGestureRecognizer *)recognizer {
	
	CGPoint location = [recognizer locationInView:self.view];
	
	[UIView animateWithDuration:0.5 animations:^{
        self.turtle.frame = CGRectMake(location.x, location.y, 83,58 );
    }];
}

- (IBAction)handleSwipeFromLeft:(UISwipeGestureRecognizer *)recognizer
{
    NSLog(@"swipe left");
    self.swipeLeft = YES;
}

- (IBAction)handleSwipeFromRight:(UISwipeGestureRecognizer *)recognizer 
{
    NSLog(@"swipe right");
    self.swipeLeft = NO;
}



// Timer event is called whenever the timer fires
- (void)onTimer
{

	// put the flake in our main view
	
    self.jellyfish.frame = CGRectMake(60, 480, 25, 25);
    self.whale.frame = CGRectMake(20,200, 229, 108);
    
    
	[UIView beginAnimations:nil context:self.jellyfish];
	// set up how fast the flake will fall
	[UIView setAnimationDuration:3];
	
	// set the postion where flake will move to
	self.jellyfish.frame = CGRectMake(60, -60,25,25);
    
    self.whale.frame = CGRectMake(320,200, 229, 108);
    if (self.swipeLeft)
    {
        self.whale.frame = CGRectMake(0,200, 229, 108);
    }
    
	
	// set a stop callback so we can cleanup the flake when it reaches the
	// end of its animation
//	[UIView setAnimationDidStopSelector:@selector(onAnimationComplete:finished:context:)];
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];
	
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.speed = .02;
    
    [NSTimer scheduledTimerWithTimeInterval:(3) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
