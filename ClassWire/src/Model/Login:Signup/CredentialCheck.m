//
//  CredentialCheck.m
//  ClassWire
//
//  Created by Phil Scarfi on 1/17/14.
//  Copyright (c) 2014 ClassWire INC. All rights reserved.
//

#import "CredentialCheck.h"

@implementation CredentialCheck


-(BOOL)checkLogin:(NSString*)string{
    string = [string lowercaseString];
    return [self stringContains:string:@"@"] && [self stringEndsWith:string :@".edu"];
}

-(BOOL)checkPassword:(NSString*)string{
    return string.length>=8;
}

-(BOOL)stringContains:(NSString*)bigString :(NSString*)substring{
    if ([bigString rangeOfString:substring].location == NSNotFound) {
        return false;
    } else {
        return true;
    }
}

-(BOOL)stringEndsWith:(NSString*)bigString :(NSString*)substring{
    return [bigString hasSuffix:substring];
}

@end
