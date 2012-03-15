//
//  GenreDelegate.h
//  CoreDataExample
//
//  Created by Matias Roldan on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Genre.h"

@protocol GenreDelegate <NSObject>

-(void) saveGenre; 
-(void) cancelGenre;
-(BOOL) existGenre:(Genre *)g;

@end
