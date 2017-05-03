//
//  HardaHttpClient.h
//  Harda
//
//  Created by Tony on 10/20/14.
//  Copyright (c) 2014 Jujia Zhizhong Co Ltd. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@class HardaHttpClient;
@protocol HardaHttpClientDelegate <NSObject>
@optional
-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url;
-(void)didFailLoadWithResponse:(NSDictionary*)response;
-(void)didLoadTimeOut;
-(void)didSessionExpire;
@end


@interface HardaHttpClient : AFHTTPRequestOperationManager
+(instancetype)sharedClient;
-(void)getDataWithUrl:(NSString*)url withParameters:(NSDictionary*)parameters deledate:(id)delegate;
-(void)postDataWithUrl:(NSString*)url withParameters:(NSDictionary*)parameters deledate:(id)delegate;
-(void)postMultiDataWithUrl:(NSString*)postUrl withParameters:(NSDictionary*)parameters withFilePath:(NSString*)filePathName deledate:(id)delegate;
@property(nonatomic,weak)id<HardaHttpClientDelegate> delegate;
@end
