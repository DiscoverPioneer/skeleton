//
//  ErrorHandle.m
//  UserDataTutorial
//
//  Created by Phil Scarfi on 12/16/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import "ErrorHandle.h"

@implementation ErrorHandle

-(void)errorToString:(NSError *)myError{
    //Based on error type, create a message, then call showAlert
}


-(void)showAlert:(NSString*)string{
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Whoops!" message:string delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}
@end
