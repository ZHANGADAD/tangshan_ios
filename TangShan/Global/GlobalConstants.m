//
//  GlobalConstants.m
//  Harda
//
//  Created by Tony on 10/20/14.
//  Copyright (c) 2014 Jujia Zhizhong Co Ltd. All rights reserved.
//

#import "GlobalConstants.h"
#import "LoginInfo.h"


NSString *kBaseUrl=@"http://wx.hbweather.com.cn/jy_module/API/";

NSString *appStoreId=@"1086532713";

NSString *UMENG_APPKEY=@"56d3b384e0f55aafe6000b15";

NSString *kTimeout=@"15";

NSString *kSessionExpiredErrorCode=@"-10005";

NSString *kSessionExpiredErrorCodeTwo=@"-10001";

NSString *hostUnReachable=@"-1009";

NSString *nointernet=@"-1004";

NSString *hostTimeOut=@"-1001";

NSString *notLogin=@"A119";

NSString *resultOK=@"1";

NSString *PUBLISHPLANE=@"PUBLISHPLANE";

NSString *PUBLISHCAR=@"PUBLISHCAR";

NSString *PRICEUNIT=@"人民币";

NSString *HARDANAME=@"HX9527TMD";

 float MINIMUM_GRAPH_Y_VALUE=0.0f;

float MINIMUM_GRAPH_Y_VALUE_1=0.0f;

 float MAXIMUM_GRAPH_Y_VALUE=0.0f;
 float MAXIMUM_GRAPH_Y_VALUE_1=0.0f;


NSMutableDictionary* commonParams(){
    return [[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"iOS",CURRENT_APP_VERSION_CODE,@"2",[LoginInfo deviceToken],nil] forKeys:[NSArray arrayWithObjects:@"source",@"version",@"type",@"device_id",nil]] mutableCopy];
}

NSArray* getRentUnit(){
    return [NSArray arrayWithObjects:@"人民币/天",@"人民币/半天",@"人民币/项", nil];
}

NSArray* getTimeServiceArray(){
    return [NSArray arrayWithObjects:@"1 小时",@"2 小时",@"3 小时",@"4 小时",@"5 小时",@"6 小时",@"7 小时",@"8 小时",@"9 小时",@"10 小时",@"11 小时",@"12 小时",@"13 小时",@"14 小时",@"15 小时",@"16 小时",@"17 小时",@"18 小时",@"19 小时",@"20 小时",@"21 小时",@"22 小时",@"23 小时",@"24 小时", nil];
}

