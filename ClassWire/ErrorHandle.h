//
//  ErrorHandle.h
//  UserDataTutorial
//
//  Created by Phil Scarfi on 12/16/13.
//  Copyright (c) 2013 Pioneer Mobile Applications. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorHandle : NSObject

-(void)errorToString:(NSError *)myError;
-(void)showAlert:(NSString*)string;

@end
