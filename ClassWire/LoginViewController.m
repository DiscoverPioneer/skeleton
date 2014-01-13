//
//  LoginViewController.m
//  UserDataTutorial
//
//  Created by Phil Scarfi on 12/14/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "SignUpViewController.h"
#import "ErrorHandle.h"
@interface LoginViewController (){
    ErrorHandle *EH;
    NSString *user;
}

@end

@implementation LoginViewController

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)checkFields{
    if(![self.secondView isDescendantOfView:self.view]){

        if (self.userName.text==nil || [self.userName.text isEqualToString:@""] || self.password.text==nil || [self.password.text isEqualToString:@""]) {
            [EH showAlert:@"Please enter your Username and Password to continue"];
            return false;
        }
        else{
            return true;
        }
    }
    else{
        if (self.createdPassword.text==nil || [self.createdPassword.text isEqualToString:@""] || self.tmpPassword.text==nil || [self.tmpPassword.text isEqualToString:@""] ) {
            [EH showAlert:@"Please enter your Temporary and Password to continue"];

            return false;
        }
        else{
            return true;
        }
    }
}

- (IBAction)signUpAction:(id)sender {
    //No Account, go to Sign Up Page
    SignUpViewController *HVC = [[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    HVC.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:HVC animated:YES completion:nil];

}

- (IBAction)loginAction:(id)sender {
    //Check if login is for reseting the password section or just a regular login
    if(![self.secondView isDescendantOfView:self.view])
    {//Regular login
        
        if([self checkFields]){
            self.signupOutlet.userInteractionEnabled=NO;
            self.loginOutlet.userInteractionEnabled=NO;
            self.forgotPasswordOutlet.userInteractionEnabled=NO;
            [self.activity startAnimating];
            
                    
               //Good to go, lets go to the home screen
                HomeViewController *HVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
                HVC.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
                [self presentViewController:HVC animated:YES completion:nil];
                [self.activity stopAnimating];
                self.signupOutlet.userInteractionEnabled=YES;
                self.loginOutlet.userInteractionEnabled=YES;
                self.forgotPasswordOutlet.userInteractionEnabled=YES;

           
        }
        
    }
    else{//login and reset password
        if([self checkFields]){
            self.login2Outlet.userInteractionEnabled=NO;
            [self.activity startAnimating];
            //Good to go, lets go to the homescreen
            HomeViewController *HVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
            [self.activity stopAnimating];
            self.login2Outlet.userInteractionEnabled=YES;

            HVC.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:HVC animated:YES completion:nil];
            [self.secondView removeFromSuperview];
      
        }
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)forgotPasswordAction:(id)sender {
    //If the user forgets their password, they can click this button, enter their username, and an email will be sent to the email that they used to reset the password with to.
    
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


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    user = [alertView textFieldAtIndex:0].text;
    if([title isEqualToString:@"Reset"])
    {
        //Show the view for forgetting passwords
        [self.view addSubview:self.secondView];   
    }
}
@end
