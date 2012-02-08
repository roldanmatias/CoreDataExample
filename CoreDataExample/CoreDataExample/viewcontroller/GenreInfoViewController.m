//
//  GenreInfoViewController.m
//  CoreDataExample
//
//  Created by Matias Roldan on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GenreInfoViewController.h"
#import "GenreDetailViewController.h"

@interface GenreInfoViewController (private)

-(void) editGenre;


@end

@implementation GenreInfoViewController

@synthesize genre, delegate;
@synthesize wvInfo;

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
    
    self.title = self.genre.name;
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] 
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                  target:self 
                                  action:@selector(editGenre)];
    
    self.navigationItem.rightBarButtonItem = editButton;
    
    self.wvInfo.delegate = self;
    
    NSURL *url = [NSURL URLWithString:self.genre.wikiURL];
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
    self.genre = nil;
    [self setWvInfo:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
	//if the user clicks on a link, open in safari
    if (navigationType != UIWebViewNavigationTypeOther) {		
		[[UIApplication sharedApplication] openURL:request.URL];		
		return NO;
	}
	return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[myIndicator stopAnimating];
    [myIndicator removeFromSuperview];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Genre" 
                                                    message:@"Wiki no loaded"
                                                   delegate:nil 
                                          cancelButtonTitle:@"Ok" 
                                          otherButtonTitles:nil];
    [alert show];
}

-(void) editGenre {	
    GenreDetailViewController *detail = [[GenreDetailViewController alloc] init];
    detail.delegate = self.delegate;
    detail.genre = self.genre;
    detail.isEditMode = YES;
    [self.navigationController pushViewController:detail animated:YES];
}


@end
