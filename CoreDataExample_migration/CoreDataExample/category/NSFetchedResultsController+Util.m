//
//  NSFetchedResultsController+Util.m
//  CoreDataExample
//
//  Created by Matias Roldan on 2/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSFetchedResultsController+Util.h"
#import "Genre.h"

@implementation NSFetchedResultsController (Util)

-(BOOL)existGenre:(Genre *)g {

    for (Genre *genre in self.fetchedObjects) {

        if ([genre.name isEqualToString: g.name]) {
            return YES;
        }
    }
    return NO;
}

@end
