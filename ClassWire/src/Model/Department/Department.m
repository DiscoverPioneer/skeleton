//
//  Department.m
//  ClassWire
//
//  Created by Alex Koshy on 1/26/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import "Department.h"

@implementation Department

- (Department *)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (Department *)initWithName:(NSString *)name
                        abbr:(NSString *)abbr
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.abbreviation = abbr;
    }
    return self;
}

@end
