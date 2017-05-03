//
//  HardaHttpClient.m
//  Harda
//
//  Created by Tony on 10/20/14.
//  Copyright (c) 2014 Jujia Zhizhong Co Ltd. All rights reserved.
//

#import "HardaHttpClient.h"
#import "GlobalConstants.h"


@interface HardaHttpClient()
@property(strong,nonatomic)NSMutableDictionary* requestUrlDictionary;
@end

@implementation HardaHttpClient

+(instancetype)sharedClient{
    static HardaHttpClient* _instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance=[[HardaHttpClient alloc]initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
        AFHTTPRequestSerializer* requestSerializer=[[AFHTTPRequestSerializer alloc]init];
        requestSerializer.timeoutInterval=[kTimeout integerValue];
        [_instance setRequestSerializer:requestSerializer];
        _instance.requestUrlDictionary=[[NSMutableDictionary alloc]init];
    });
    return _instance;
}
-(void)getDataWithUrl:(NSString*)url withParameters:(NSDictionary*)parameters deledate:(id)delegate{
    self.delegate=delegate;
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:url relativeToURL:[NSURL URLWithString:kBaseUrl]] absoluteString] parameters:parameters error:nil];
    NSString* keyString=[request.URL.absoluteString md5];
    [self.requestUrlDictionary setValue:self.delegate forKey:keyString];
    
    [self GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString* keyDelegate=[operation.request.URL.absoluteString md5];
        id  sychChopeDelegate=[self.requestUrlDictionary objectForKey:keyDelegate];
        if ([responseObject containsObject:@"code"]) {
            NSInteger hardaHttpExpireCode= [responseObject[@"code"] integerValue];
            if(hardaHttpExpireCode==[kSessionExpiredErrorCode integerValue]||hardaHttpExpireCode==[kSessionExpiredErrorCodeTwo integerValue]){
                if ([sychChopeDelegate respondsToSelector:@selector(didSessionExpire)]) {
                    [self.requestUrlDictionary removeObjectForKey:keyDelegate];
                    keyDelegate=nil;
                    [sychChopeDelegate didSessionExpire];
                }
            }else{
                if ([sychChopeDelegate respondsToSelector:@selector(didLoadResponse:fromUrl:)]) {
                    [self.requestUrlDictionary removeObjectForKey:keyDelegate];
                    keyDelegate=nil;
                    [sychChopeDelegate didLoadResponse:responseObject fromUrl:url];
                }
                
            }

        }else{
            if ([sychChopeDelegate respondsToSelector:@selector(didLoadResponse:fromUrl:)]) {
                [self.requestUrlDictionary removeObjectForKey:keyDelegate];
                keyDelegate=nil;
                [sychChopeDelegate didLoadResponse:responseObject fromUrl:url];
            }
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSString* keyDelegate=[operation.request.URL.absoluteString md5];
        id  sychChopeDelegate=[self.requestUrlDictionary objectForKey:keyDelegate];
        if (error.code==[hostTimeOut integerValue]) {
            if ([sychChopeDelegate respondsToSelector:@selector(didLoadTimeOut)]) {
                [self.requestUrlDictionary removeObjectForKey:keyDelegate];
                keyDelegate=nil;
                [sychChopeDelegate didLoadTimeOut];
            }
        }else{
            
            if ([sychChopeDelegate respondsToSelector:@selector(didFailLoadWithResponse:)]) {
                [self.requestUrlDictionary removeObjectForKey:keyDelegate];
                keyDelegate=nil;
                if (error.code==[hostUnReachable integerValue]||error.code==[nointernet integerValue]){
                    [sychChopeDelegate didFailLoadWithResponse:@{@"MESSAGE": NSLocalizedString(@"NOINTERNET", @"")}];
                }else{
                    [sychChopeDelegate didFailLoadWithResponse:operation.responseObject];
                }
                
            }
        }
    }];
    
    
    
}
-(void)postDataWithUrl:(NSString*)url withParameters:(NSDictionary*)parameters deledate:(id)delegate{
    
    self.delegate=delegate;
    
    [self POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([self.delegate respondsToSelector:@selector(didLoadResponse:fromUrl:)]) {
            NSInteger hardaHttpExpireCode=[responseObject[@"code"] integerValue];
            
            if(hardaHttpExpireCode==[kSessionExpiredErrorCode integerValue]||hardaHttpExpireCode==[kSessionExpiredErrorCodeTwo integerValue]){
                if ([self.delegate respondsToSelector:@selector(didSessionExpire)]) {
                    [self.delegate didSessionExpire];
                }
            }else{
                [self.delegate didLoadResponse:responseObject fromUrl:url];
            }
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error.code==[hostTimeOut integerValue]) {
            if ([self.delegate respondsToSelector:@selector(didLoadTimeOut)]) {
                [self.delegate didLoadTimeOut];
            }
        }else{
            
            if (error.code==[hostUnReachable integerValue]||error.code==[nointernet integerValue]) {
                if ([self.delegate respondsToSelector:@selector(didFailLoadWithResponse:)]) {
                    [self.delegate didFailLoadWithResponse:@{@"MESSAGE": NSLocalizedString(@"NOINTERNET", @"")}];
                }
            }else{
                if ([self.delegate respondsToSelector:@selector(didFailLoadWithResponse:)]) {
                    [self.delegate didFailLoadWithResponse:operation.responseObject];
                }
                
            }
        }
    }];
}

-(void)postMultiDataWithUrl:(NSString*)postUrl withParameters:(NSDictionary*)parameters withFilePath:(NSString*)filePathName deledate:(id)delegate{
    
    self.delegate=delegate;
    
    NSURL* filePath=[NSURL URLWithString:[NSString stringWithFormat:@"file://%@",filePathName]];
    
    [self POST:postUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileURL:filePath name:@"files" error:nil];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([self.delegate respondsToSelector:@selector(didLoadResponse:fromUrl:)]) {
            NSInteger hardaHttpExpireCode=[responseObject[@"code"] integerValue];
            if(hardaHttpExpireCode==[kSessionExpiredErrorCode integerValue]||hardaHttpExpireCode==[kSessionExpiredErrorCodeTwo integerValue]){
                if ([self.delegate respondsToSelector:@selector(didSessionExpire)]) {
                    [self.delegate didSessionExpire];
                }
            }else{
                [self.delegate didLoadResponse:responseObject fromUrl:postUrl];
            }
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error.code==[hostTimeOut integerValue]) {
            if ([self.delegate respondsToSelector:@selector(didLoadTimeOut)]) {
                [self.delegate didLoadTimeOut];
            }
        }else{
            
            if (error.code==[hostUnReachable integerValue]||error.code==[nointernet integerValue]) {
                if ([self.delegate respondsToSelector:@selector(didFailLoadWithResponse:)]) {
                    [self.delegate didFailLoadWithResponse:@{@"MESSAGE": NSLocalizedString(@"NOINTERNET", @"")}];
                }
            }else{
                if ([self.delegate respondsToSelector:@selector(didFailLoadWithResponse:)]) {
                    [self.delegate didFailLoadWithResponse:operation.responseObject];
                }
                
            }
        }
        
    }];
    
    
}

@end
