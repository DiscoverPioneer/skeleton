//
//  Department.h
//  ClassWire
//
//  Created by Alex Koshy on 1/26/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Department : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *abbreviation;

- (Department *)init;
- (Department *)initWithName:(NSString *)name
                        abbr:(NSString *)abbr;

@end
