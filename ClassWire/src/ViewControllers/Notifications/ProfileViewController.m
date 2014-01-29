//
//  ProfileViewController.m
//  ClassWire
//
//  Created by Phil Scarfi on 1/28/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController (){
    NSArray *labelArray;
    UIBarButtonItem *addButton;
}

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"My Profile";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.contentSize=CGSizeMake(320, 620);
  // then set frame to be the size of the view's frame
    self.scrollView.frame = self.view.frame;
    // now add our scroll view to the main view
    [self.view addSubview:self.scrollView];
    
    
    self.navigationItem.rightBarButtonItem=self.editButtonItem;
    
    [self makeData];
    [self loadTestData];
    
}
-(void)makeData{
    labelArray = [[NSArray alloc]initWithObjects:_nameLabel,_universityNameLabel,_universityLocationLabel,_graduatingClassLabel,_majorLabel, nil];
    for (UILabel *label in labelArray) {
        label.enabled=NO;
    }
    
    
}

- (void)setEditing:(BOOL)flag animated:(BOOL)animated
{
    [super setEditing:flag animated:animated];
    [self toggleFields];
    if (flag == YES){
        // Change views to edit mode.
        NSLog(@"Edit");
        
    }
    else {
        // Save the changes if needed and change the views to noneditable.
       
    }
}

-(void)loadTestData{
    self.nameLabel.text=@"Phil Scarfi";
    self.universityNameLabel.text=@"University Of Massachusetts - Amherst";
    self.universityLocationLabel.text=@"Amherst MA";
    self.graduatingClassLabel.text=@"2016";
    self.majorLabel.text=@"Computer Science & Management";
    self.currentClasses.text=@"CS230, CS240, OIM 210, Accounting 222, Management 260";
    self.pastClasses.text = @"CS121, CS187, CS220, CS250, Accounting 221, Chem111";
    self.profileImage.image = [UIImage imageNamed:@"lax.jpg"];
    
}

-(void)toggleFields{
    if (self.editing) {
        for (UILabel *label in labelArray) {
            label.enabled=YES;
        }
        self.currentClasses.editable=YES;
        self.pastClasses.editable=YES;
        self.scrollView.contentSize=CGSizeMake(320, 800);

    }
    else{
        for (UILabel *label in labelArray) {
            label.enabled=NO;
        }
        self.currentClasses.editable=NO;
        self.pastClasses.editable=NO;
        self.scrollView.contentSize=CGSizeMake(320, 620);


    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
