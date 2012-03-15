//
//  Album.h
//  CoreDataExample
//
//  Created by Matias Roldan on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Album : NSManagedObject

@property (nonatomic, retain) NSNumber * albumID;
@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * albumDate;
@property (nonatomic, retain) NSString * test;

@end
