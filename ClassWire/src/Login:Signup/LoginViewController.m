//
//  LoginViewController.m
//  UserDataTutorial
//
//  Created by Phil Scarfi on 12/14/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "LoginViewController.h"
#import "MessagesViewController.h"
#import "CoursesViewController.h"
#import "NewsFeedViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"
#import "SignUpViewController.h"
#import "ErrorHandle.h"
#import "CredentialCheck.h"
@interface LoginViewController (){
    ErrorHandle *EH;
    CredentialCheck *CC;
    NSString *user;
}

@end

@implementation LoginViewController

# pragma mark Initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    EH =  [[ErrorHandle alloc]init];
    CC = [[CredentialCheck alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.userName.text = @"";
    self.password.text = @"";
}

# pragma mark Validation

-(BOOL)checkFields {
    if(![self.secondView isDescendantOfView:self.view]) {
        if (self.userName.text==nil || [self.userName.text isEqualToString:@""] || self.password.text==nil || [self.password.text isEqualToString:@""]) {
            [EH showAlert:@"Please enter your Username and Password to continue"];
            return false;
        }
        else {
            return true;
        }
    }
    else {
        if (self.createdPassword.text==nil || [self.createdPassword.text isEqualToString:@""] || self.tmpPassword.text==nil || [self.tmpPassword.text isEqualToString:@""] ) {
            [EH showAlert:@"Please enter your Temporary and Password to continue"];
            return false;
        }
        else {
            return true;
        }
    }
}

# pragma mark IBActions

- (IBAction)signUpAction:(id)sender {
    //No Account, go to Sign Up Page
    SignUpViewController *HVC = [[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    HVC.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:HVC animated:YES completion:nil];

}

- (IBAction)loginAction:(id)sender {
    // Check if login is for reseting the password section or just a regular login
    if(![self.secondView isDescendantOfView:self.view]) // Regular Login
    {
        if([self checkFields] && [CC checkLogin:self.userName.text] && [CC checkPassword:self.password.text]) {
        
            self.signupOutlet.userInteractionEnabled = NO;
            self.loginOutlet.userInteractionEnabled = NO;
            self.forgotPasswordOutlet.userInteractionEnabled = NO;
            [self.activity startAnimating];
            
            
            /*/ Phil's code
            // Good to go, lets go to the home screen
            HomeViewController *HVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
            HVC.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            // */
             
            // Alex's addition
            UITabBarController *tbc = [LoginViewController createTabBarController];
            tbc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            
            [self presentViewController:tbc animated:YES completion:nil];
            [self.activity stopAnimating];
            self.signupOutlet.userInteractionEnabled = YES;
            self.loginOutlet.userInteractionEnabled = YES;
            self.forgotPasswordOutlet.userInteractionEnabled = YES;
        }
        else{
            [EH showAlert:@"Make Sure your password has atleast 8 characters, and you're using a university email"];

        }
    }
    else //login and reset password
    {
        if([self checkFields] && [CC checkPassword:self.createdPassword.text]) {

            self.login2Outlet.userInteractionEnabled = NO;
            [self.activity startAnimating];
            //Good to go, lets go to the homescreen
            
            /*/ Phil's Code
            HomeViewController *HVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
            HVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            // */
            
            // Alex's addition
            UITabBarController *tbc = [LoginViewController createTabBarController];
            [self.activity stopAnimating];
            self.login2Outlet.userInteractionEnabled = YES;
            
            [self presentViewController:tbc animated:YES completion:nil];
            [self.secondView removeFromSuperview];
        }
        else{
            [EH showAlert:@"Make Sure your new password has atleast 8 characters"];
        }
    }
}

- (IBAction)forgotPasswordAction:(id)sender {
    // If the user forgets their password, they can click this button.
    // Upon entering their username, an email will be sent to the email address provided with instructions to reset.
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Reset Password"
                          message:@"Please enter your Username, an email will be sent containing a temporary password"
                          delegate:self
                          cancelButtonTitle: @"Cancel"
                          otherButtonTitles:@"Reset", nil ];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField* tempPass = [alert textFieldAtIndex:0];
    tempPass.placeholder = @"Username";
    [alert show];
}

# pragma mark Other

+ (UITabBarController *)createTabBarController
{
    // Initialize Tab Bar Controller
    UITabBarController *tbc = [[UITabBarController alloc] init];
    
    // Create Tab Bar VCs
    MessagesViewController *msgVC = [[MessagesViewController alloc] initWithNibName:@"MessagesViewController" bundle:nil];
    UINavigationController *NVC1 = [[UINavigationController alloc] initWithRootViewController:msgVC];
    
    CoursesViewController *coursesVC = [[CoursesViewController alloc] initWithNibName:@"CoursesViewController" bundle:nil];
    UINavigationController *NVC2 = [[UINavigationController alloc] initWithRootViewController:coursesVC];
    
    NewsFeedViewController *newsVC = [[NewsFeedViewController alloc] initWithNibName:@"NewsFeedViewController" bundle:nil];
    UINavigationController *NVC3 = [[UINavigationController alloc] initWithRootViewController:newsVC];
    
    NotificationsViewController *notifVC = [[NotificationsViewController alloc] initWithNibName:@"NotificationsViewController" bundle:nil];
    UINavigationController *NVC4 = [[UINavigationController alloc] initWithRootViewController:notifVC];
    
    MoreViewController *moreVC = [[MoreViewController alloc] initWithNibName:@"MoreViewController" bundle:nil];
    UINavigationController *NVC5 = [[UINavigationController alloc] initWithRootViewController:moreVC];
    
    // Set Tab Bar Titles
    [moreVC.tabBarItem setTitle:@"More"];
    
    // Set Tab Bar VCS
    NSArray *controllers = [[NSArray alloc] initWithObjects:NVC1, NVC2, NVC3, NVC4, NVC5, nil];
    [tbc setViewControllers:controllers animated:NO];
    
    // Set "Courses" as starting tab
    [tbc setSelectedIndex:1];
    
    // Set transition style
    tbc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    return tbc;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    user = [alertView textFieldAtIndex:0].text;
    if([title isEqualToString:@"Reset"])
    {
        // Show the view for forgetting passwords
        [self.view addSubview:self.secondView];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end












