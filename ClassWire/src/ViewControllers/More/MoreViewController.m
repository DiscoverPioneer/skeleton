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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0: // First Section of menu items
            switch (indexPath.row)
            {
                case 0: // View Profile
                    // Navigate to ProfilePageViewController
                    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
                    break;
                case 1: // Manage Friends
                    // Navigate to FriendsListViewController
                    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
                    break;
                case 2: // Resources
                    // Navigate to ResourcesViewController
                    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
                    break;
                default:
                    break;
            }
            break;
        case 1: // Second Section of menu items
            switch (indexPath.row)
            {
                case 0: // Settings
                    // Navigate to SettingsViewController
                    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
                    break;
                case 1: // Terms and Conditions
                    // Navigate to ToCViewController
                    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
                    break;
                case 2: // About
                    // Navigate to AboutViewController
                    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
                    break;
                case 3: // Report an Issue
                    // Navigate to IssueViewController
                    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
                    break;
                case 4: // Log Out
                    [self showLogOutActionSheet];
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"Me", @"Me");
            break;
        case 1:
            sectionName = NSLocalizedString(@"ClassWire", @"ClassWire");
            break;
            // ...
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (void)logOut
{
    // Function to be called by "Log Out" button on action sheet
    
    // Perform Log Out logic here
    
    // Return to Login Screen
    [self dismissViewControllerAnimated:YES completion:nil];
}

# pragma mark UIActionSheet

- (void)showLogOutActionSheet
{
    // Action Sheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure you want to log out?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Log Out"
                                                    otherButtonTitles:nil, nil];
    //actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
    // */
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if  ([buttonTitle isEqualToString:@"Log Out"])
    {
        [self logOut];
    }
    if ([buttonTitle isEqualToString:@"Cancel"])
        [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

@end



















