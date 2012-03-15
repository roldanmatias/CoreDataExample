//
//  Label.m
//  CoreDataExample
//
//  Created by Matias Roldan on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Label.h"

@implementation Label

@synthesize name = _name;

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    _name = [aDecoder decodeObjectForKey:@"name"];
    return self;
}

@end
