//
//  ProfileViewController.h
//  ClassWire
//
//  Created by Phil Scarfi on 1/28/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) IBOutlet UITextField *nameLabel;
@property (strong, nonatomic) IBOutlet UITextField *universityNameLabel;
@property (strong, nonatomic) IBOutlet UITextField *universityLocationLabel;
@property (strong, nonatomic) IBOutlet UITextField *majorLabel;
@property (strong, nonatomic) IBOutlet UITextField *graduatingClassLabel;
@property (strong, nonatomic) IBOutlet UITextView *currentClasses;
@property (strong, nonatomic) IBOutlet UITextView *pastClasses;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
