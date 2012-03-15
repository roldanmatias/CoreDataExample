//
//  ArtistDelegate.h
//  CoreDataExample
//
//  Created by Matias Roldan on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ArtistDelegate <NSObject>

-(void) saveArtist; 
-(void) cancelArtist;

@end
