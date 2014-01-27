//
//  LoginViewController.h
//  UserDataTutorial
//
//  Created by Phil Scarfi on 12/14/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)signUpAction:(id)sender;
- (IBAction)loginAction:(id)sender;
- (IBAction)forgotPasswordAction:(id)sender;


// Forgotten Password Stuff
@property (strong, nonatomic) IBOutlet UIView *secondView;
@property (strong, nonatomic) IBOutlet UITextField *tmpPassword;
@property (strong, nonatomic) IBOutlet UITextField *createdPassword;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;

// Outlets
@property (strong, nonatomic) IBOutlet UIButton *signupOutlet;
@property (strong, nonatomic) IBOutlet UIButton *loginOutlet;
@property (strong, nonatomic) IBOutlet UIButton *forgotPasswordOutlet;
@property (strong, nonatomic) IBOutlet UIButton *login2Outlet;

// TabBar
+ (UITabBarController *)createTabBarController;

@end
