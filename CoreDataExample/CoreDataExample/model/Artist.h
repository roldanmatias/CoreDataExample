//
//  Artist.h
//  CoreDataExample
//
//  Created by Matias Roldan on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Artist : NSManagedObject

@property (nonatomic, retain) NSNumber * artistID;
@property (nonatomic, retain) NSNumber * country;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * imgData;
@property (nonatomic, retain) NSString * wikiURL;

@end
