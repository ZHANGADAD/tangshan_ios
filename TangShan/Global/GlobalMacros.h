//
//  GlobalMacros.h
//  Harda
//
//  Created by Tony on 10/20/14.
//  Copyright (c) 2014 Jujia Zhizhong Co Ltd. All rights reserved.
//
#define IMAGE(NAME)                [UIImage imageNamed:NAME]
#define COLOR_PATTERN_IMAGE(NAME)  [UIColor colorWithPatternImage:[UIImage imageNamed:NAME]]
#define CLEAR_COLOR                [UIColor clearColor]
#define COMMON_BG_COLOR            [UIColor colorWithHexString:@"0xf8f6f7"]
#define FONT_OF_SIZE(size)         [UIFont systemFontOfSize:size]
#define CURRENT_APP_VERSION        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define CURRENT_APP_VERSION_CODE   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IOS7_OR_LATER (DeviceSystemMajorVersion() >= 7)

#define IS_IPHONE_5_HEIGHT  ([[ UIScreen mainScreen ] bounds ].size.height<=568)
#define IS_IPHONE_6P_HEIGHT ( [[ UIScreen mainScreen ] bounds ].size.height>=736)
#define IS_IOS8_OR_LATER (DeviceSystemMajorVersion() >= 8)
#define HARDASTORBOARD [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define HEIGHTH  [UIScreen mainScreen].bounds.size.height
#define WIDETH  [UIScreen mainScreen].bounds.size.width

#define HARDATITLEFONT [UIFont boldSystemFontOfSize:20.0f]
#define HARDATITLERIGHTFONT [UIFont systemFontOfSize:15.0f]

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"

#define CAMERA_SCALAR_WIDTH 3.0f
#define CAMERA_SCALAR_HEIGHT 2.0f

