//
//  GenreDetailViewController.h
//  CoreDataExample
//
//  Created by Matias Roldan on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenreDelegate.h"
@class Genre;

@interface GenreDetailViewController : UIViewController

@property (weak, nonatomic) id<GenreDelegate> delegate;
@property (nonatomic) BOOL isEditMode;
@property (strong, nonatomic) Genre *genre;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtWikiURL;

@end
