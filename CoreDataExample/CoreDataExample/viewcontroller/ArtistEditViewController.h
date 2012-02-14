//
//  ArtistEditViewController.h
//  CoreDataExample
//
//  Created by Matias Roldan on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"
#import "ArtistDelegate.h"

@interface ArtistEditViewController : UIViewController

@property (weak, nonatomic) id<ArtistDelegate> delegate;
@property (strong, nonatomic) Artist *artist;
@property (nonatomic) BOOL isEditMode;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtImageUrl;
@property (strong, nonatomic) IBOutlet UITextField *txtWikiUrl;

@end
