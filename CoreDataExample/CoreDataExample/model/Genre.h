//
//  Genre.h
//  CoreDataExample
//
//  Created by Matias Roldan on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Genre : NSManagedObject

@property (nonatomic, retain) NSNumber * genreID;
@property (nonatomic, retain) NSString * name;

@end
