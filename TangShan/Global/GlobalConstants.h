//
//  GlobalConstants.h
//  Harda
//
//  Created by Tony on 10/20/14.
//  Copyright (c) 2014 Jujia Zhizhong Co Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *appStoreId;

extern NSString *UMENG_APPKEY;

extern NSString *kBaseUrl;

extern NSString *kTimeout;

extern NSString *kSessionExpiredErrorCode;

extern NSString* kSessionExpiredErrorCodeTwo;

extern NSString *hostUnReachable;

extern NSString *nointernet;

extern NSString *hostTimeOut;

extern NSString *notLogin;

extern NSString *resultOK;

extern NSString *PUBLISHCAR;

extern NSString *PUBLISHPLANE;

extern NSString *PRICEUNIT;

extern NSString *HARDANAME;

extern float MINIMUM_GRAPH_Y_VALUE;
extern float MINIMUM_GRAPH_Y_VALUE_1;

extern float MAXIMUM_GRAPH_Y_VALUE;
extern float MAXIMUM_GRAPH_Y_VALUE_1;

//#define MINIMUM_GRAPH_Y_VALUE -3
//#define MAXIMUM_GRAPH_Y_VALUE 3

NSMutableDictionary* commonParams();

NSArray* getRentUnit();

NSArray* getTimeServiceArray();
