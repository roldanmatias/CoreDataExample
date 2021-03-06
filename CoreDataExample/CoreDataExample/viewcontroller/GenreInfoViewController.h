//
//  GenreInfoViewController.h
//  CoreDataExample
//
//  Created by Matias Roldan on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Genre.h"
#import "GenreDelegate.h"

@interface GenreInfoViewController : UIViewController<UIWebViewDelegate>

@property(nonatomic, strong) Genre *genre;
@property (strong, nonatomic) id<GenreDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIWebView *wvInfo;

@end
