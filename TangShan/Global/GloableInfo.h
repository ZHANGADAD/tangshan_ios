//
//  GloableInfo.h
//  TangShan
//
//  Created by chemi ios on 1/1/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GloableInfo : NSObject

+(NSDictionary*)getDefaultCityInfo;

+(void)setDefaultCityInfo:(NSString*)cityName withStationNum:(NSString*)indexStation;

+(void)setChooseCityInfo:(NSDictionary*)cityInfos;


+(NSInteger)isSetDefault;
+(void)setDefaultCC;

+(void)setCacheInfo:(NSString*)keeee withContent:(NSDictionary*)adasf;
+(NSDictionary*)getCacheInfo:(NSString*)keeee ;

+(void)setCacheInfoPast:(NSString*)keeee withContent:(NSDictionary*)adasf;
+(NSDictionary*)getCacheInfoPast:(NSString*)keeee ;

+(NSString*)getHebeiStationNumByCityName:(NSString*)cityName;



+(NSArray*)getChooseCityInfo;

+(void)saveChooseCityInfo:(NSArray*)cccoc;

+ (NSMutableArray *)getCityData;

+(NSMutableArray*)getHotCityData;

+(NSMutableArray*)getMoreCityData;

+(NSString*)getStationNumByCityName:(NSString*)cityName;


+(NSDictionary*)getLocationCityInfo;

+(void)setLocationCityInfo:(NSDictionary*)idddd;


+(NSInteger)getGpsInfo;
+(void)setGpsInfo:(NSInteger)gpsInfo;

+(NSInteger)pushInfo;
+(void)setPushInfo:(NSInteger)pushInfo;


+(NSInteger)pushInfoQixiang;
+(void)setPushInfoQixiang:(NSInteger)pushInfo;

+(NSInteger)pushInfoYubao;
+(void)setPushInfoYubao:(NSInteger)pushInfo;

+(void)setDeviceToken:(NSString*)dddd;
+(NSString*)getDeviceToken;

+(NSString*)getLatitude;
+(void)setLatitude:(NSString*)latitude;

+(NSString*)getLongtitude;
+(void)setLongtitude:(NSString*)latitude;


+(NSString*)getStartTime;
+(void)setStartTime:(NSString*)latitude;

+(NSString*)getEndTime;
+(void)setEndTime:(NSString*)latitude;

@end
