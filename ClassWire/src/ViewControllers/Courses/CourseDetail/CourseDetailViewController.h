//
//  CourseDetailViewController.h
//  ClassWire
//
//  Created by Alex Koshy on 1/26/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Course;

@interface CourseDetailViewController : UIViewController

@property (nonatomic, strong) Course *course;
@property (strong, nonatomic) IBOutlet UILabel *courseName;
@property (strong, nonatomic) IBOutlet UILabel *courseTitle;

@end
