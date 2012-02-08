//
//  ArtistEditViewController.m
//  CoreDataExample
//
//  Created by Matias Roldan on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArtistEditViewController.h"

@interface ArtistEditViewController (private)

-(void) cancel;
-(void) save;

@end

@implementation ArtistEditViewController
@synthesize txtName;
@synthesize txtImageUrl;
@synthesize txtWikiUrl;

@synthesize artist, delegate, isEditMode;

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
    
    self.title = @"Add Artist";
    
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

    if (self.isEditMode) {
        self.txtName.text = self.artist.name;
        self.txtWikiUrl.text = self.artist.wikiURL;
        //self.txtImageUrl.text = self.artist.imgData;
    }
}

- (void)viewDidUnload
{
    [self setTxtName:nil];
    [self setTxtImageUrl:nil];
    [self setTxtWikiUrl:nil];
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

    if (self.txtName.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Artist" 
                                                        message:@"Add an Artist name"
													   delegate:nil 
                                              cancelButtonTitle:@"Ok" 
                                              otherButtonTitles:nil];
        [alert show];
    } else {
        
        self.artist.name = self.txtName.text;
        self.artist.wikiURL = self.txtWikiUrl.text;
        
        if (self.txtImageUrl.text.length > 0) {
            NSURL *url = [NSURL URLWithString:self.txtImageUrl.text];
            NSData * imageData = [[NSData alloc] initWithContentsOfURL: url];
            self.artist.imgData = imageData;
        }

        [self.delegate saveArtist];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
