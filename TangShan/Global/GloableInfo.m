//
//  GloableInfo.m
//  TangShan
//
//  Created by chemi ios on 1/1/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "GloableInfo.h"

@implementation GloableInfo


+(NSDictionary*)getDefaultCityInfo{
    NSString* cityName= [[NSUserDefaults standardUserDefaults] objectForKey:@"sName"];
    NSString* indexStation= [[NSUserDefaults standardUserDefaults] objectForKey:@"sNum"];
    if (cityName) {
        return @{@"sName":cityName,@"sNum":indexStation};
    }else{
        [self setDefaultCityInfo:@"唐山" withStationNum:@"54534"];
        return @{@"sName":@"唐山",@"sNum":@"54534"};
    }
    
}

+(NSInteger)isSetDefault{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"setDefaultCC"];
}
+(void)setDefaultCC{
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"setDefaultCC"];
}

+(void)setDefaultCityInfo:(NSString*)cityName  withStationNum:(NSString*)indexStation{
    [[NSUserDefaults standardUserDefaults] setObject:cityName forKey:@"sName"];
    [[NSUserDefaults standardUserDefaults] setObject:indexStation forKey:@"sNum"];
    [[NSUserDefaults standardUserDefaults ] synchronize];
}


+(void)setChooseCityInfo:(NSDictionary*)cityInfos{
    
    NSArray * aDF=[self getChooseCityInfo];
    NSMutableArray* adaFAF=  [[NSMutableArray alloc]initWithArray:aDF];
    
    if (aDF.count>0) {
        NSInteger index=0;
        for (NSDictionary* adadf in aDF) {
            if ([adadf[@"sNum"] isEqual:cityInfos[@"sNum"]]) {
                index=1;
            }
        }
        
        if (index==0) {
            [adaFAF addObject:cityInfos];
        }
    }else{
        [adaFAF addObject:cityInfos];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithArray:adaFAF] forKey:@"setChooseCityInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)saveChooseCityInfo:(NSArray*)cccoc{
    
    [[NSUserDefaults standardUserDefaults] setObject:cccoc forKey:@"setChooseCityInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSArray*)getChooseCityInfo{
    
    NSArray* ADAfsaf= [[NSUserDefaults standardUserDefaults] objectForKey:@"setChooseCityInfo"];
    NSString* adSAfd= [self getLocationCityInfo][@"sNum"];
    NSMutableArray* daD=[[NSMutableArray alloc]init];
    for (NSInteger i=0; i<ADAfsaf.count; i++) {
        NSDictionary* dasf=  [ADAfsaf objectAtIndex:i];
        if (![dasf[@"sNum"] isEqualToString:adSAfd]) {
            [daD addObject:dasf];
        }
    }
    return daD;
}

+ (NSMutableArray *)getCityData
{
    
    NSString *Json_path = [[NSBundle mainBundle]pathForResource:@"stationNum-Name"ofType:@"json"];
    
    //==Json数据
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    //==JsonObject
    NSError *error;
    NSMutableArray* JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                               options:NSJSONReadingAllowFragments
                                                                 error:&error];
    return JsonObject;
}


+ (NSMutableArray *)getHebeiCityData
{
    
    NSString *Json_path = [[NSBundle mainBundle]pathForResource:@"hebistationName"ofType:@"json"];
    
    //==Json数据
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    //==JsonObject
    NSError *error;
    NSDictionary* JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingAllowFragments
                                                               error:&error];
    NSMutableArray* mutableArray=[[NSMutableArray alloc]init];
    for (NSDictionary* dictionary in JsonObject[@"city"]) {
        for (NSDictionary* dictionaryContent in dictionary[@"county"]) {
            NSMutableDictionary* mDictionary=[[NSMutableDictionary alloc]init];
            [mDictionary setObject:dictionaryContent[@"name"] forKey:@"sName"];
            [mDictionary setObject:dictionaryContent[@"stationid"] forKey:@"sNum"];
            [mutableArray addObject:mDictionary];
        }
    }
    return mutableArray;
}


+ (NSMutableArray *)getSearchCityData
{
    
    NSString *Json_path = [[NSBundle mainBundle]pathForResource:@"stationName"ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    NSError *error;
    NSMutableArray* JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                               options:NSJSONReadingAllowFragments
                                                                 error:&error];
    
    NSMutableArray* arrayResult=[[NSMutableArray alloc]init];
    for (NSDictionary* mContent in JsonObject) {
        NSString* provinceName=mContent[@"province"];
        for (NSDictionary* mDicContent in mContent[@"city"]) {
            NSString* cityName=mDicContent[@"name"];
            NSMutableDictionary* dddddd=[[NSMutableDictionary alloc]init];
            NSMutableArray* contentArray=[[NSMutableArray alloc]init];
            for (NSDictionary* mDistrictContent in mDicContent[@"county"]) {
                NSMutableDictionary* districtDictionary=[[NSMutableDictionary alloc]init];
                [districtDictionary setObject:mDistrictContent[@"name"] forKey:@"sName"];
                [districtDictionary setObject:mDistrictContent[@"stationid"] forKey:@"sNum"];
                [contentArray addObject:districtDictionary];
            }
            NSString* keyddd= [NSString stringWithFormat:@"%@ %@",provinceName,cityName];
            [dddddd setObject:contentArray forKey:keyddd];
            [arrayResult addObject:dddddd];
        }
    }
    
    
    return arrayResult;
}

+ (NSMutableArray *)getMoreCityData
{
    
    NSMutableArray* JsonObject=[[self getCityData] mutableCopy];
    NSMutableArray* sadaDA=   [self getHotCityData];
    
    for (NSDictionary* ADAdfa in sadaDA) {
        if ([JsonObject indexOfObject:ADAdfa]!=NSNotFound) {
            [JsonObject removeObject:ADAdfa];
        }
    }
    return JsonObject;
}

+(NSMutableArray*)getHotCityData{
    
    NSMutableArray * ararrr=[[NSMutableArray alloc]initWithObjects:@{@"sNum":@"54511",@"sName":@"北京"},@{@"sNum":@"58362",@"sName":@"上海"},@{@"sNum":@"59287",@"sName":@"广州"},@{@"sNum":@"59493",@"sName":@"深圳"},@{@"sNum":@"57494",@"sName":@"武汉"},@{@"sNum":@"58238",@"sName":@"南京"}, @{@"sNum":@"57036",@"sName":@"西安"},@{@"sNum":@"56294",@"sName":@"成都"},@{@"sNum":@"58457",@"sName":@"杭州"},@{@"sNum":@"57083",@"sName":@"郑州"},@{@"sNum":@"57516",@"sName":@"重庆"},@{@"sNum":@"54342",@"sName":@"沈阳"},nil];
    return ararrr;
}


+(NSString*)getStationNumByCityName:(NSString*)cityName{
    NSArray* arrayContent=[self getCityData];
    if ([cityName containsString:@"市"]) {
        cityName=[cityName stringByReplacingOccurrencesOfString:@"市" withString:@""];
    }
    
    cityName= [cityName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString* indexxx=nil;
    for (NSDictionary* ADFAF in arrayContent) {
        if ([ADFAF[@"sName"] containsString:cityName]) {
            indexxx=ADFAF[@"sNum"];
            break;
        }
    }
    
    if (indexxx) {
        //        if (![self getDefaultCityInfo][@"sName"]) {
        //            [self setDefaultCityInfo:cityName withStationNum:indexxx];
        //        }
        
        
        [self setLocationCityInfo:@{@"sName":cityName,@"sNum":indexxx}];
    }else{
        //        if (![self getDefaultCityInfo][@"sName"]) {
        //            [self setDefaultCityInfo:@"唐山" withStationNum:@"54534"];
        //        }
        [self setLocationCityInfo:@{@"sName":@"唐山",@"sNum":@"54534"}];
    }
    return indexxx;
}


+(NSString*)getHebeiStationNumByCityName:(NSString*)cityName{
    NSArray* arrayContent=[self getHebeiCityData];
    
    cityName= [cityName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString* indexxx=nil;
    for (NSDictionary* ADFAF in arrayContent) {
        NSString* afsfsfsName=[NSString stringWithFormat:@"%@县",ADFAF[@"sName"]];
        if ([afsfsfsName containsString:cityName]) {
            indexxx=ADFAF[@"sNum"];
            break;
        }
    }
    
    if (indexxx) {
        [self setLocationCityInfo:@{@"sName":cityName,@"sNum":indexxx}];
    }else{
        
        [self setLocationCityInfo:@{@"sName":@"唐山",@"sNum":@"54534"}];
    }
    return indexxx;
}

+(NSDictionary*)getLocationCityInfo{
    
    NSDictionary* cityName= [[NSUserDefaults standardUserDefaults] objectForKey:@"setChooseCityInfoDADAFDF"];
    if (!cityName) {
        return @{@"sName":@"唐山",@"sNum":@"54534"};
    }
    return cityName;
}

+(void)setLocationCityInfo:(NSDictionary*)idddd{
    
    [[NSUserDefaults standardUserDefaults] setObject:idddd forKey:@"setChooseCityInfoDADAFDF"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


+(NSInteger)getGpsInfo{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"setGpsInfo"];
    
}
+(void)setGpsInfo:(NSInteger)gpsInfo{
    [[NSUserDefaults standardUserDefaults] setInteger:gpsInfo forKey:@"setGpsInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


+(NSInteger)pushInfo{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"setdddddddddPushInfo"];
}
+(void)setPushInfo:(NSInteger)pushInfo{
    [[NSUserDefaults standardUserDefaults] setInteger:pushInfo forKey:@"setdddddddddPushInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


+(NSInteger)pushInfoQixiang{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"setPushInfoQixiang"];
}
+(void)setPushInfoQixiang:(NSInteger)pushInfo{
    [[NSUserDefaults standardUserDefaults] setInteger:pushInfo forKey:@"setPushInfoQixiang"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+(NSInteger)pushInfoYubao{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"pushdddddddasadsfarqwrwreInfo"];
}
+(void)setPushInfoYubao:(NSInteger)pushInfo{
    [[NSUserDefaults standardUserDefaults] setInteger:pushInfo forKey:@"pushdddddddasadsfarqwrwreInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



+(void)setCacheInfoPast:(NSString*)keeee withContent:(NSDictionary*)adasf{
    NSString* key1=[NSString stringWithFormat:@"%@iiiiiffffffffii%@",@"keeee",keeee];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:adasf];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key1];
    [[NSUserDefaults standardUserDefaults] setInteger:[[NSDate date] timeIntervalSince1970] forKey:[NSString stringWithFormat:@"%@dsf%@",@"keefffffffffee",keeee]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(NSDictionary*)getCacheInfoPast:(NSString*)keeee{
    NSInteger ADAFSF= [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"%@dsf%@",@"keefffffffffee",keeee]];
    if ([[NSDate date] timeIntervalSince1970]-ADAFSF>3600*3) {
        return nil;
    }else{
        NSData *data=  [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@iiiiiffffffffii%@",@"keeee",keeee]];
        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
}

+(void)setCacheInfo:(NSString*)keeee withContent:(NSDictionary*)adasf{
    NSString* key1=[NSString stringWithFormat:@"%@iiiiiii%@",@"keeee",keeee];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:adasf];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key1];
    [[NSUserDefaults standardUserDefaults] setInteger:[[NSDate date] timeIntervalSince1970] forKey:[NSString stringWithFormat:@"%@dsf%@",@"keeee",keeee]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(NSDictionary*)getCacheInfo:(NSString*)keeee{
    NSInteger ADAFSF= [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"%@dsf%@",@"keeee",keeee]];
    if ([[NSDate date] timeIntervalSince1970]-ADAFSF>3600*3) {
        return nil;
    }else{
        NSData *data=  [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@iiiiiii%@",@"keeee",keeee]];
        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
}


+(void)setDeviceToken:(NSString*)dddd{
    [[NSUserDefaults standardUserDefaults] setObject:dddd forKey:@"pushInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(NSString*)getDeviceToken{
    return   [[NSUserDefaults standardUserDefaults] valueForKey:@"pushInfo"];
}



+(NSString*)getLatitude{
    return  [[NSUserDefaults standardUserDefaults] valueForKey:@"setLatitude"];
}
+(void)setLatitude:(NSString*)latitude{
    [[NSUserDefaults standardUserDefaults] setObject:latitude forKey:@"setLatitude"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString*)getLongtitude{
    return  [[NSUserDefaults standardUserDefaults] valueForKey:@"setLongtitude"];
}
+(void)setLongtitude:(NSString*)latitude{
    [[NSUserDefaults standardUserDefaults] setObject:latitude forKey:@"setLongtitude"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(NSString*)getStartTime{
    NSString* adaf=[[NSUserDefaults standardUserDefaults] valueForKey:@"getStartTime"];
    if (adaf) {
        return adaf;
    }
    return  @"0700";
}
+(void)setStartTime:(NSString*)latitude{
    [[NSUserDefaults standardUserDefaults] setObject:latitude forKey:@"getStartTime"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString*)getEndTime{
    NSString* daf=[[NSUserDefaults standardUserDefaults] valueForKey:@"setEndTime"];
    if (daf) {
        return daf;
    }
    return  @"2200";
}
+(void)setEndTime:(NSString*)latitude{
    [[NSUserDefaults standardUserDefaults] setObject:latitude forKey:@"setEndTime"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
