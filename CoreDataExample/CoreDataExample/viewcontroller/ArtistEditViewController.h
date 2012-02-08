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

@property (strong, nonatomic) Artist *artist;
@property (strong, nonatomic) id<ArtistDelegate> delegate;
@property (nonatomic) BOOL isEditMode;


@end
