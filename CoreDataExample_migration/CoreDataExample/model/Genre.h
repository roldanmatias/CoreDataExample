//
//  Genre.h
//  CoreDataExample
//
//  Created by Matias Roldan on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Genre : NSManagedObject

@property (nonatomic, retain) NSNumber * genreID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * wikiURL;

@end
