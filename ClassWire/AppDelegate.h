//
//  AppDelegate.h
//  ClassWire
//
//  Created by Phil Scarfi on 1/12/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "LoginViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) LoginViewController *logInViewController;

-(void)showTabBar;
@end
