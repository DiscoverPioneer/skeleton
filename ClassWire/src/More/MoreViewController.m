//
//  MoreViewController.m
//  ClassWireTest
//
//  Created by Alex Koshy on 1/12/14.
//  Copyright (c) 2014 KoshyDev. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
{
    NSArray *section1;
    NSArray *section2;
}

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"More";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    section1 = [[NSArray alloc] initWithObjects:@"View Profile", @"Manage Friends", @"Resources", nil];
    section2 = [[NSArray alloc] initWithObjects:@"Settings", @"Terms and Conditions", @"About",
                                                @"Report an Issue", @"Log Out", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark Table View Protocol

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return section1.count;
    else
        return section2.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (indexPath.section == 0)
    {
        cell.textLabel.text = [section1 objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [section2 objectAtIndex:indexPath.row];
    }
    
    return cell;
}

@end











