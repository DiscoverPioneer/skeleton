//
//  CredentialCheck.h
//  ClassWire
//
//  Created by Phil Scarfi on 1/17/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CredentialCheck : NSObject


-(BOOL)checkLogin:(NSString*)string;
-(BOOL)checkPassword:(NSString*)string;
@end
