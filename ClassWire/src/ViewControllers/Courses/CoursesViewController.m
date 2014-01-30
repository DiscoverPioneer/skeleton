//
//  CoursesViewController.m
//  ClassWireTest
//
//  Created by Alex Koshy on 1/12/14.
//  Copyright (c) 2014 KoshyDev. All rights reserved.
//

#import "CoursesViewController.h"
#import "CourseDetailViewController.h"
#import "Course.h"
#import "Department.h"

@interface CoursesViewController ()

@end

@implementation CoursesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.title = @"Courses";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:nil
                                                                               action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didChooseCourse:(UIButton *)sender
{
    Course *c;
    Department *cs = [[Department alloc] initWithName:@"Computer Science"
                                                 abbr:@"CS"];
    Department *stats = [[Department alloc] initWithName:@"Statistics"
                                                    abbr:@"Stats"];
    switch (sender.tag) {
        case 1:
            c = [[Course alloc] initWithNumber:@"230"
                                         title:@"Computer Systems Principles"
                                          prof:@"Tim Richards"
                                          dept:cs
                                      semester:@"Spring"
                                          year:2014];
            break;
        case 2:
            c = [[Course alloc] initWithNumber:@"240"
                                         title:@"Reasoning Under Uncertainty"
                                          prof:@"Andrew McGregor"
                                          dept:cs
                                      semester:@"Spring"
                                          year:2014];
            break;
        case 3:
            c = [[Course alloc] initWithNumber:@"311"
                                         title:@"Intro to Algorithms"
                                          prof:@"Ramesh Siataraman"
                                          dept:cs
                                      semester:@"Spring"
                                          year:2014];
            break;
        case 4:
            c = [[Course alloc] initWithNumber:@"515"
                                         title:@"Statistics I"
                                          prof:@"Erin Conlon"
                                          dept:stats
                                      semester:@"Spring"
                                          year:2014];
            break;
        default:
            c = [[Course alloc] init];
            break;
    }
    
    // Create new CourseDetail controller with Course
    
    CourseDetailViewController *CDVC = [[CourseDetailViewController alloc] initWithNibName:@"CourseDetailViewController" bundle:nil];
    CDVC.course = c;
    [self.navigationController pushViewController:CDVC animated:YES];
}

@end






























