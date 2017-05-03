//
//  AppDelegate.m
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "AppDelegate.h"
#import "ShiyuanhuiViewController.h"
#import "TianqiViewController.h"
#import "FuwuViewController.h"
#import "SettingsViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

#import <iflyMSC/IFlyMSC.h>


#define UMSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define _IPHONE80_ 80000

BMKMapManager *_mapManager;

@interface AppDelegate ()<BMKGeneralDelegate, BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate,UNUserNotificationCenterDelegate>
@property (nonatomic) BMKLocationService *locationService;
@property(nonatomic)BMKGeoCodeSearch*  geoSearch;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if ([GloableInfo isSetDefault]==0) {
        [GloableInfo setPushInfo:1];
        [GloableInfo setPushInfoQixiang:1];
        [GloableInfo setPushInfoYubao:1];
        [GloableInfo setGpsInfo:1];
        [GloableInfo setDefaultCC];
    }
    [self umengTrack:launchOptions];
    [self setUpBaidu];
    [self initYuYin];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupViewControllers];
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSMutableDictionary* diddd=[[NSMutableDictionary alloc]init];
    [diddd setValue:@"iOS" forKey:@"platform"];
    [diddd setValue:[GloableInfo getDeviceToken] forKey:@"device_token"];
    [diddd setValue:[GloableInfo getLatitude] forKey:@"latitude"];
    [diddd setValue:[GloableInfo getLongtitude] forKey:@"longitude"];
    [diddd setValue:[GloableInfo getStartTime] forKey:@"pushtimebegin"];
    [diddd setValue:[GloableInfo getEndTime] forKey:@"pushtimeend"];
    [diddd setValue:[NSString stringWithFormat:@"%ld",(long)[GloableInfo pushInfo]] forKey:@"push"];
    [diddd setValue:[NSString stringWithFormat:@"%ld",(long)[GloableInfo pushInfoQixiang]] forKey:@"qxzhyjpush"];
    [diddd setValue:[NSString stringWithFormat:@"%ld",(long)[GloableInfo pushInfoYubao]] forKey:@"tqybpush"];
    [diddd setValue:[GloableInfo getLocationCityInfo][@"sName"] forKey:@"city"];
    [diddd setValue:[GloableInfo getLatitude] forKey:@"latitude"];
    [diddd setValue:[GloableInfo getLongtitude] forKey:@"longitude"];
    [diddd setValue:@"99999999999" forKey:@"telno"];
    [[HardaHttpClient sharedClient] getDataWithUrl:messageUrl withParameters:diddd deledate:self];
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    [self setCurrentLocation:userLocation];
    [GloableInfo setLatitude:[NSString stringWithFormat:@"%f",userLocation.location.coordinate.latitude]];
    [GloableInfo setLongtitude:[NSString stringWithFormat:@"%f",userLocation.location.coordinate.longitude]];
    [[self locationService] stopUserLocationService];
    [[self locationService] setDelegate:nil];
    BMKReverseGeoCodeOption *revGeoOption = [[BMKReverseGeoCodeOption alloc] init];
    [revGeoOption setReverseGeoPoint:userLocation.location.coordinate];
    [[self geoSearch] reverseGeoCode:revGeoOption];
}

- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {
    if(error == BMK_SEARCH_NO_ERROR) {
        NSString* province=[result addressDetail].province;
        NSString* cityInfo=[result addressDetail].city;
        if ([province containsString:@"河北"]) {
            NSString* dddddd=[result addressDetail].district;
            if ([dddddd containsString:@"区"]) {
                [GloableInfo getStationNumByCityName:cityInfo];
            }else{
                [GloableInfo getHebeiStationNumByCityName:dddddd];
            }
            
        }else{
            
            [GloableInfo getStationNumByCityName:cityInfo];
        }
    }
    
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [UMessage registerDeviceToken:deviceToken];
    [GloableInfo setDeviceToken:[self deviceToken:deviceToken]];
    
}



- (NSString *)deviceToken:(NSData *)deviceToken {
    NSString* token=[deviceToken description];
    NSString* postToken=[[[token stringByReplacingOccurrencesOfString:@"<" withString:@""] stringByReplacingOccurrencesOfString:@">" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    return postToken;
}


- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    //如果注册不成功，打印错误信息，可以在网上找到对应的解决方案
    //如果注册成功，可以删掉这个方法
    NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //关闭友盟自带的弹出框
    [UMessage setAutoAlert:NO];
    
    [UMessage didReceiveRemoteNotification:userInfo];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:[NSString stringWithFormat:@"%@",userInfo] forKey:@"UMPuserInfoNotification"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"userInfoNotification" object:self userInfo:@{@"userinfo":[NSString stringWithFormat:@"%@",userInfo]}];
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}
//iOS10新增：处理前台收到通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [UMessage setAutoAlert:NO];
        //应用处于前台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:[NSString stringWithFormat:@"%@",userInfo] forKey:@"UMPuserInfoNotification"];
        
    }else{
        //应用处于前台时的本地推送接受
    }
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
}

//iOS10新增：处理后台点击通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于后台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:[NSString stringWithFormat:@"%@",userInfo] forKey:@"UMPuserInfoNotification"];
        
    }else{
        //应用处于后台时的本地推送接受
    }
    
}


#pragma mark - Methods

- (void)umengTrack:(NSDictionary*) launchOptions{
    //        [MobClick setCrashReportEnabled:NO]; // 如果不需要捕捉异常，注释掉此行
    [MobClick setLogEnabled:NO];  // 打开友盟sdk调试，注意Release发布时需要注释掉此行,减少io消耗
    [MobClick setAppVersion:XcodeAppVersion]; //参数为NSString * 类型,自定义app版本信息，如果不设置，默认从CFBundleVersion里取
    //
    UMConfigInstance.appKey = UMENG_APPKEY;
//    UMConfigInstance.secret = @"secretstringaldfkals";
    //    UMConfigInstance.eSType = E_UM_GAME;
    [MobClick startWithConfigure:UMConfigInstance];

    //set AppKey and LaunchOptions
    [UMessage startWithAppkey:UMENG_APPKEY launchOptions:launchOptions httpsEnable:YES];
    
    //注册通知
    [UMessage registerForRemoteNotifications];
    //iOS10必须加下面这段代码。
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate=self;
    UNAuthorizationOptions types10=UNAuthorizationOptionBadge|UNAuthorizationOptionAlert|UNAuthorizationOptionSound;
    [center requestAuthorizationWithOptions:types10 completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            //点击允许
            
        } else {
            //点击不允许
            
        }
    }];
    
    
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMENG_APPKEY];

    //设置微信AppId、appSecret，分享url
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx3f9cee272a16a685" appSecret:@"108a9408960c98d00a8e41f2bf22ef78" redirectURL:@"http://mobile.umeng.com/social"];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105035101"/*设置QQ平台的appID*/  appSecret:@"xWfsa0qhABhYvHq9" redirectURL:@"http://mobile.umeng.com/social"];
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。若在新浪后台设置我们的回调地址，“http://sns.whalecloud.com/sina2/callback”，这里可以传nil ,需要 #import "UMSocialSinaHandler.h"
//    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3849735649" RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"3849735649"  appSecret:nil redirectURL:@"https://sns.whalecloud.com/sina2/callback"];

}

- (void)setupViewControllers {
//    UIViewController *firstViewController = [[ShiyuanhuiViewController alloc] init];
//    UIViewController *firstNavigationController = [[UINavigationController alloc]
//                                                   initWithRootViewController:firstViewController];
    
    UIViewController *secondViewController = [[TianqiViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UIViewController *thirdViewController = [[FuwuViewController alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    UIViewController *fourViewController = [[SettingsViewController alloc] init];
    UIViewController *fourNavigationController = [[UINavigationController alloc]
                                                  initWithRootViewController:fourViewController];
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[secondNavigationController,
                                           thirdNavigationController,fourNavigationController]];
    self.viewController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageWithColor:[UIColor colorWithHexString:@"0x0001203d"]];
    UIImage *unfinishedImage = [UIImage imageWithColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f]];
    NSArray* conyent=[NSArray arrayWithObjects:@"天气",@"服务",@"设置", nil];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        [item setTitle:[conyent objectAtIndex:index]];
        index++;
    }
}

-(void)setUpBaidu{
    _mapManager = [[BMKMapManager alloc]init];
    
    self.geoSearch=[[BMKGeoCodeSearch alloc]init];
    self.geoSearch.delegate=self;
    BOOL ret = [_mapManager start:@"dwfyerm8A7kllzCWvErXs5Mw" generalDelegate:self];
    
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    [self setLocationService:[[BMKLocationService alloc] init]];
    [[self locationService] setDelegate:self];
    [[self locationService] startUserLocationService];
}

-(void)initYuYin{
    
    //设置sdk的log等级，log保存在下面设置的工作路径中
    [IFlySetting setLogFile:LVL_ALL];
    
    //打开输出在console的log开关
    [IFlySetting showLogcat:YES];
    
    //设置sdk的工作路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths objectAtIndex:0];
    [IFlySetting setLogFilePath:cachePath];
    
    //创建语音配置,appid必须要传入，仅执行一次则可
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",@"5698a3e1"];
    
    //所有服务启动前，需要确保执行createUtility
    [IFlySpeechUtility createUtility:initString];

}

@end
