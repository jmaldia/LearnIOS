//
//  SecondViewController.m
//  coredataapp
//
//  Created by Shawn Arney on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "coredataappAppDelegate.h"

@implementation SecondViewController

@synthesize books;


// perform search
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
 
   
    
    [self.tableView reloadData];
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
    Book *book = (Book *)[self.books objectAtIndex:indexPath.row];
    
    cell.textLabel.text = book.title; 
    cell.tag = indexPath.row;
    
    // add the favorites button to the cell
    UIButton *btnFavorite = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [btnFavorite setFrame:CGRectMake(280, 0, 44, 44)];
    
    [btnFavorite setTitle:@"X" forState:UIControlStateNormal];
    
    [btnFavorite addTarget:self action:@selector(deleteTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:btnFavorite];
    
    return cell;       
}

- (IBAction)deleteTouched:(id)sender
{

}

@end
