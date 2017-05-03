//
//  NSString+CHCategory.h
//  Harda
//
//  Created by Tony on 10/20/14.
//  Copyright (c) 2014 Jujia Zhizhong Co Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CHCategory)

- (NSString *)stringByTrimming;

- (BOOL)isValidEmail;

-(BOOL)isContainSpecilal;

- (BOOL)isValidPhone;

-(NSString*)md5;

@end
