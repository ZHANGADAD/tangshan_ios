//
//  GlobalUICommon.m
//  Harda
//
//  Created by Tony on 10/20/14.
//  Copyright (c) 2014 Jujia Zhizhong Co Ltd. All rights reserved.
//

#import "GlobalUICommon.h"

void BBAlertNoTitle(NSString* message){
    if (IS_IOS8_OR_LATER) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@" "
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                              otherButtonTitles:nil];
        [alert show];
        
    }else{
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                              otherButtonTitles:nil];
        [alert show];
    }
    

}
void BBAlertWithTitleAndMsg(NSString* title, NSString* message){
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                          otherButtonTitles:nil];
    [alert show];

}
NSUInteger DeviceSystemMajorVersion(){
    static NSUInteger _deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
    });
    return _deviceSystemMajorVersion;

}



