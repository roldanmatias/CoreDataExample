//
//  NSFetchedResultsController+Util.h
//  CoreDataExample
//
//  Created by Matias Roldan on 2/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Genre.h"

@interface NSFetchedResultsController (Util)

-(BOOL)existGenre:(Genre *)g;

@end
