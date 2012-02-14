//
//  ArtistInfoViewController.m
//  CoreDataExample
//
//  Created by Matias Roldan on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArtistInfoViewController.h"
#import "ArtistEditViewController.h"

@interface ArtistInfoViewController (private)

-(void) editArtist;

@end

@implementation ArtistInfoViewController

@synthesize wvInfo = _wvInfo;
@synthesize artist = _artist;
@synthesize delegate = _delegate;

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

UIActivityIndicatorView *myIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = self.artist.name;
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] 
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                   target:self 
                                   action:@selector(editArtist)];
    
    self.navigationItem.rightBarButtonItem = editButton;
    
    self.wvInfo.delegate = self;
    
    NSURL *url = [NSURL URLWithString:self.artist.wikiURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
	[self.wvInfo loadRequest:requestObj];
    
    myIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	myIndicator.center = CGPointMake(160, 175);
	myIndicator.hidesWhenStopped = NO;
    [self.view addSubview:myIndicator];
    [myIndicator startAnimating];
}

- (void)viewDidUnload
{
    [self setWvInfo:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[myIndicator stopAnimating];
    [myIndicator removeFromSuperview];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Artist" 
                                                    message:@"Wiki no loaded"
                                                   delegate:nil 
                                          cancelButtonTitle:@"Ok" 
                                          otherButtonTitles:nil];
    [alert show];
}

-(void) editArtist {	
    ArtistEditViewController *detail = [[ArtistEditViewController alloc] init];
    detail.delegate = self.delegate;
    detail.artist = self.artist;
    detail.isEditMode = YES;
    [self.navigationController pushViewController:detail animated:YES];
}

@end
