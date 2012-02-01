//
//  GenreDetailViewController.m
//  CoreDataExample
//
//  Created by Matias Roldan on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GenreDetailViewController.h"
#import "Genre.h"

@interface GenreDetailViewController (private)

-(void) cancel;
-(void) save;
    
@end

@implementation GenreDetailViewController

@synthesize txtName;
@synthesize isEditMode;
@synthesize delegate;
@synthesize genre;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Add Genre";
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] 
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                  target:self 
                                  action:@selector(cancel)];
    
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    UIBarButtonItem *okButton = [[UIBarButtonItem alloc] 
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                     target:self 
                                     action:@selector(save)];
    
    self.navigationItem.rightBarButtonItem = okButton;
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


#pragma mark - Private Methods

-(void) cancel {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) save {
    self.genre.name = self.txtName.text;
    
    if ([self.delegate existGenre:self.genre]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Genre" 
                                                        message:@"Genre already exists"
													   delegate:nil 
                                              cancelButtonTitle:@"Ok" 
                                              otherButtonTitles:nil];
        [alert show];
    } else {
        [self.delegate saveGenre];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
