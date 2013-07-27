//
//  FirstViewController.m
//  coredataapp
//
//  Created by Shawn Arney on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "coredataappAppDelegate.h"

#import "Book.h"
#import <CoreData/CoreData.h>

@implementation FirstViewController

@synthesize books;

- (void) dealloc
{
    self.books = nil;
    [super dealloc];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self searchAppsByKeyword:@"compass"];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) searchAppsByKeyword: (NSString *) keyword
{
    
	NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey: NSLocaleCountryCode];
	
	NSString *searchTerms = [[NSString alloc] initWithFormat:@"https://www.googleapis.com/books/v1/volumes?q=search+intitle:%@&projection=lite&maxResults=3",keyword, countryCode];

	NSURL *jsonURL = [NSURL URLWithString:searchTerms];
	[searchTerms release];
	
	NSError *err= nil;
	NSString *jsonData = [[NSString alloc] initWithContentsOfURL:jsonURL encoding:NSUTF8StringEncoding error:&err];

    // with book data... split into an array
    NSArray *items = [jsonData componentsSeparatedByString:@"\"title\": \""];
    
    self.books = nil; // reset each time
    self.books = [[NSMutableArray alloc] init ];
    
    for (int i = 1; i < [items count]; i++) // i is 1 to ignore first 'garbage title'
    {
        NSString *itemText = [items objectAtIndex:i];
        
        NSRange endOfTitleText = [itemText rangeOfString:@"\","];

        NSString *title = [itemText substringToIndex:endOfTitleText.location];
        
        [self.books addObject:title];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text = [self.books objectAtIndex:indexPath.row]; 
    
    // add the favorites button to the cell
    UIButton *btnFavorite = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    [btnFavorite setFrame:CGRectMake(280, 0, 44, 44)];
    
    [btnFavorite addTarget:self action:@selector(favoriteTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:btnFavorite];
    
    return cell;       
}

- (IBAction)favoriteTouched:(id)sender
{

}

@end
