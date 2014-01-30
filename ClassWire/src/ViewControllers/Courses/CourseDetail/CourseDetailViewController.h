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

// Data
@property (nonatomic, strong) Course *course;

// IBOutlets
@property (strong, nonatomic) IBOutlet UILabel *courseName;
@property (strong, nonatomic) IBOutlet UILabel *courseTitle;
@property (strong, nonatomic) IBOutlet UILabel *semester;
@property (strong, nonatomic) IBOutlet UILabel *year;
@property (strong, nonatomic) IBOutlet UILabel *professor;

@end
