//
//  CourseDetailViewController.m
//  ClassWire
//
//  Created by Alex Koshy on 1/26/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import "CourseDetailViewController.h"
#import "Course.h"
#import "Department.h"

@interface CourseDetailViewController ()

@end

@implementation CourseDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Details";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.courseName.text = [self.course getCourseName];
    self.courseTitle.text = self.course.courseTitle;
    self.semester.text = self.course.semester;
    self.year.text = [NSString stringWithFormat:@"%li", (long)self.course.year];
    self.professor.text = self.course.professor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
