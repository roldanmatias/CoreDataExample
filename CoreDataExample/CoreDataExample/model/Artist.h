//
//  Artist.h
//  CoreDataExample
//
//  Created by Matias Roldan on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Genre;

@interface Artist : NSManagedObject

@property (nonatomic, retain) NSNumber * artistID;
@property (nonatomic, retain) NSNumber * country;
@property (nonatomic, retain) NSData * imgData;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * wikiURL;
@property (nonatomic, retain) id labels;
@property (nonatomic, retain) Genre *genre;

@end
