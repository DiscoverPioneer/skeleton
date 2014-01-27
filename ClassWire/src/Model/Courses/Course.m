//
//  Course.m
//  ClassWire
//
//  Created by Alex Koshy on 1/26/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import "Course.h"
#import "Department.h"
#import "Section.h"

@implementation Course

- (Course *)init
{
    self = [super init];
    if (self)
    {
        self.courseNumber = @"";
        self.courseTitle = @"";
        self.prof = @"";
        self.dept = [[Department alloc] init];
        self.section = [[Section alloc] init];
        self.semester = @"";
        self.year = 0;
    }
    return self;
}

- (Course *)initWithNumber:(NSString *)num
                     title:(NSString *)title
                      prof:(NSString *)prof
                      dept:(Department *)dept
                   section:(Section *)section
                  semester:(NSString *)sem
                      year:(NSInteger)year
{
    self = [super init];
    if (self)
    {
        self.courseNumber = num;
        self.courseTitle = title;
        self.prof = prof;
        self.dept = dept;
        self.section = section;
        self.semester = sem;
        self.year = year;
    }
    return self;
}

- (NSString *)getCourseName
{
    return [NSString stringWithFormat:@"%@ %@", self.dept.abbreviation, self.courseNumber];
}

@end














