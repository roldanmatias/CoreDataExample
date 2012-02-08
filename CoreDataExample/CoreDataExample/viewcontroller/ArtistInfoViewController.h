//
//  ArtistInfoViewController.h
//  CoreDataExample
//
//  Created by Matias Roldan on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"
#import "ArtistDelegate.h"

@interface ArtistInfoViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *wvInfo;
@property(nonatomic, strong) Artist *artist;
@property (strong, nonatomic) id<ArtistDelegate> delegate;

@end
