//
//  Course.h
//  ClassWire
//
//  Created by Alex Koshy on 1/26/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Department;
@class Section;

@interface Course : NSObject

// Stored as NSString because of possibility of character additions - Ex. CS 197C
@property (nonatomic, strong) NSString *courseNumber;
@property (nonatomic, strong) NSString *courseTitle;
@property (nonatomic, strong) NSString *professor;
@property (nonatomic, strong) Department *dept;
@property (nonatomic, strong) NSString *semester;
@property (nonatomic, assign) NSInteger year;
// Include Uploaded Material Object Here

// Initialization
- (Course *)init;
- (Course *)initWithNumber:(NSString *)num
                     title:(NSString *)title
                      prof:(NSString *)prof
                      dept:(Department *)dept
                  semester:(NSString *)sem
                      year:(NSInteger)year;

// Accessory Methods
- (NSString *)getCourseName;

// Database Query Methods
// 1 - pull list of users enrolled in the course
// 2 -

@end
