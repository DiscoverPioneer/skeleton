//
//  SignUpViewController.m
//  UserDataTutorial
//
//  Created by Phil Scarfi on 12/14/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "SignUpViewController.h"
#import "LoginViewController.h"
#import "ErrorHandle.h"

@interface SignUpViewController (){
    ErrorHandle *EH;
    NSMutableArray *textFieldArray;

}

@end

@implementation SignUpViewController

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
    textFieldArray = [[NSMutableArray alloc]init];
    [textFieldArray addObject:self.password];
    [textFieldArray addObject:self.email];



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goAction:(id)sender {
    //CheckFields first
    if([self checkFields]) {
        [self login];
    }
}

-(BOOL)checkFields{
    for (UITextField *ts in textFieldArray) {
        if (ts.text==nil || [ts.text isEqualToString:@""] || [ts.text isEqualToString:nil]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Hold Up!" message:@"Please make sure that all fields are filled in completely!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
            return false;
        }
    }
    return true;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}



- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)login {
    NSLog(@"Successfully Logged In");
    
    //Good to go, go to home screen
    /*/ Phil's Code
    HomeViewController *HVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    HVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:HVC animated:YES completion:nil];
    // */
    
    // Alex's additions
    [self presentViewController:[LoginViewController createTabBarController] animated:YES completion:nil];
    
}

@end














