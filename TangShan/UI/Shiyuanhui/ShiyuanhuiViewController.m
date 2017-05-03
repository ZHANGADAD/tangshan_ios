//
//  ShiyuanhuiViewController.m
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "ShiyuanhuiViewController.h"
#import "TqView.h"
#import "TqZhanKaiView.h"
#import "RDVTabBarController.h"
#import "TianqiYubaoViewController.h"
#import "YujingViewController.h"
//#import "USCSpeechSynthesizer.h"
#import "CommonViewController.h"
#import "FiveDaysViewController.h"
#import "KongqiViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ShiyuanhuiViewController ()<TqViewDelegate,TqZhanKaiViewDelegate,HardaHttpClientDelegate,UMSocialShareMenuViewDelegate>

@property(strong,nonatomic)NSDictionary* contentcOPU;
@property(strong,nonatomic)TqView* tianqiView;
@property(strong,nonatomic)TqZhanKaiView* tianqiZhanKai;
@property(strong,nonatomic)MPMusicPlayerController *musicPlayer;
@property(assign,nonatomic)BOOL isSpeaking;
//@property (nonatomic,strong)USCSpeechSynthesizer *speechSynthesizer;
@end

@implementation ShiyuanhuiViewController


/**
 *  合成器启动
 */
- (void)synthesizerSpeechStart{
    
}

/**
 *  开始朗读回调
 */
- (void)synthesizerSpeechStartSpeaking{
    self.isSpeaking=YES;
}

/**
 *  合成取消回调,包括取消合成和取消播放
 */
- (void)synthesizerDidCanceled{
    self.isSpeaking=NO;
}

/**
 *  朗读暂停回调
 */
- (void)synthesizerSpeechDidPaused{
}

/**
 *  朗读恢复回调
 */
- (void)synthesizerSpeechDidResumed{
    
}

/**
 *  朗读结束回调
 */
- (void)synthesizerSpeechDidFinished{
    self.isSpeaking=NO;
}

/**
 *  TTS中间出错回调
 *
 *  @param error 错误对象
 */
- (void)synthesizerErrorOccurred:(NSError *)error{
    self.isSpeaking=NO;
}

- (void)synthesizedData:(NSData *)data{
    
}

-(void)dadasfffaf{
    KongqiViewController* connnn=[[KongqiViewController alloc]initWithNibName:nil bundle:nil];
    connnn.sName=@"唐山";
    connnn.sNum=@"50000";
    [self.navigationController pushViewController:connnn animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tianqiView=[[TqView alloc]initWithFrame:self.view.frame];
    self.tianqiView.backGroudView.image=IMAGE(@"shiyuanhui");
    self.tianqiView.delegate=self;
    [self.view addSubview:self.tianqiView];
    [self.tianqiView.locationImageView setHidden:YES];
    
    [self initYuYin];
    [self initShare];
    
    [self.tianqiView.conditionButton addTarget:self action:@selector(dadasfffaf) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.tianqiView.ADASFSF addTarget:self action:@selector(adafsffggg) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tianqiView.btToday addTarget:self action:@selector(adaffs) forControlEvents:UIControlEventTouchUpInside];
    
    self.tianqiView.homeImage.image=IMAGE(@"shiyuanhuicon");
    
    self.tianqiZhanKai=[[TqZhanKaiView alloc]initWithFrame:self.view.frame];
    self.tianqiZhanKai.delegate=self;
    [self.view addSubview:self.tianqiZhanKai];
    [self.tianqiZhanKai setHidden:YES];
    
    self.tianqiView.locationLable.text=@"唐山";
    
    [self getData];
}
-(void)adaffs{
    
    [self.tianqiView setHidden:YES];
    [self.tianqiZhanKai setHidden:NO];
    self.tianqiZhanKai.locationLable.text=self.tianqiView.locationLable.text;
    [self.tianqiZhanKai getDtaa];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    [self getdadfsfsf];
}

-(void)adafsffggg{
    FiveDaysViewController* adafSafsaF=[[FiveDaysViewController alloc]initWithNibName:nil bundle:nil];
    adafSafsaF.sNum=@"50000";
    adafSafsaF.sName=@"世园会";
    adafSafsaF.isShiyuanhui=YES;
    [self.navigationController pushViewController:adafSafsaF animated:YES];
}

-(void)initYuYin{
//    self.speechSynthesizer = [[USCSpeechSynthesizer alloc]initWithAppkey:@"rhj4thzsu7bgpybua3qzspaad6r5x7erjlh6vay2"];
//    self.speechSynthesizer.delegate=self;
    self.musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
}
-(void)initShare{
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_WechatSession),
                                               @(UMSocialPlatformType_WechatTimeLine),
                                               @(UMSocialPlatformType_WechatFavorite),
                                               @(UMSocialPlatformType_QQ),
                                               @(UMSocialPlatformType_Qzone),
                                               @(UMSocialPlatformType_Sina),
                                               @(UMSocialPlatformType_Sms),
                                               ]];
     [UMSocialUIManager setShareMenuViewDelegate:self];
}

#pragma mark Private Methods
-(void)initViewWithData:(NSDictionary*)content{
    self.contentcOPU=content;
    [self getWeek];
    self.tianqiView.cityLable.text=content[@"basic"][@"stationName"];
    
    NSString* adADA= [NSString stringWithFormat:@"%@",content[@"now"][@"tmp"]];
    //    if (adADA.length>4) {
    //        adADA=[adADA substringWithRange:NSMakeRange(0, 4)];
    //    }
    self.tianqiView.tempLabel.text=adADA;
    NSString* adaF=[content[@"daily_forecast"] objectAtIndex:0][@"txt_n"];
    if (![adaF isEqual:[NSNull null]]) {
        self.tianqiView.tempQingyinLable.text=adaF;
    }
    
    self.tianqiView.fengxiangLable.text=[NSString stringWithFormat:@"%@%@级 湿度 %@%%",content[@"now"][@"wind_dir_txt"],content[@"now"][@"wind_sc"],content[@"now"][@"hum"]];
    
    self.tianqiView.tempLabelUnit.text=@"o";
    self.tianqiView.qiyaLable.text= [NSString stringWithFormat:@"气压: %@hpa",content[@"now"][@"pres"]];
    //yestody
    self.tianqiView.yubaoLable.text=@"预报";
    
    [self setTimeBobao:content[@"yestoday"][@"date"] withLable:self.tianqiView.onedayLable withConditon1:content[@"yestoday"][@"txt_d"] withConditon2:content[@"yestoday"][@"txt_n"] withLabel:self.tianqiView.onedayLableY withTiqiLable:self.tianqiView.onedayLableYN];
    
    NSArray* arrayConytent= content[@"daily_forecast"];
    [self setTimeBobao:[arrayConytent objectAtIndex:0][@"date"] withLable:self.tianqiView.twodayLable withConditon1:[arrayConytent objectAtIndex:0][@"txt_d"] withConditon2:[arrayConytent objectAtIndex:0][@"txt_n"] withLabel:self.tianqiView.twodayLableY withTiqiLable:self.tianqiView.twodayLableYN];
    
    [self setTimeBobao:[arrayConytent objectAtIndex:1][@"date"] withLable:self.tianqiView.threedayLable withConditon1:[arrayConytent objectAtIndex:1][@"txt_d"] withConditon2:[arrayConytent objectAtIndex:1][@"txt_n"] withLabel:self.tianqiView.threedayLableY withTiqiLable:self.tianqiView.threedayLableYN];
    
    
    [self setTimeBobao:[arrayConytent objectAtIndex:2][@"date"] withLable:self.tianqiView.fourdayLable withConditon1:[arrayConytent objectAtIndex:2][@"txt_d"] withConditon2:[arrayConytent objectAtIndex:2][@"txt_n"] withLabel:self.tianqiView.fourdayLableY withTiqiLable:self.tianqiView.fourdayLableYN];
    
    [self setTimeBobao:[arrayConytent objectAtIndex:3][@"date"] withLable:self.tianqiView.fivedayLable withConditon1:[arrayConytent objectAtIndex:3][@"txt_d"] withConditon2:[arrayConytent objectAtIndex:3][@"txt_n"] withLabel:self.tianqiView.fivedayLableY withTiqiLable:self.tianqiView.fivedayLableYN];
    
    [self setTimeBobao:[arrayConytent objectAtIndex:4][@"date"] withLable:self.tianqiView.sixdayLable withConditon1:[arrayConytent objectAtIndex:4][@"txt_d"] withConditon2:[arrayConytent objectAtIndex:4][@"txt_n"] withLabel:self.tianqiView.sixdayLableY withTiqiLable:self.tianqiView.sixdayLableYN];
    
    [self setImageWithConditon:content[@"yestoday"][@"txt_d"] withImage:self.tianqiView.oneImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:0][@"txt_d"] withImage:self.tianqiView.twoImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:1][@"txt_d"] withImage:self.tianqiView.threeImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:2][@"txt_d"] withImage:self.tianqiView.fourImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:3][@"txt_d"] withImage:self.tianqiView.fiveImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:4][@"txt_d"] withImage:self.tianqiView.sixImage isDay:YES];
    
    [self setImageWithConditon:content[@"yestoday"][@"txt_n"] withImage:self.tianqiView.oneImageN isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:0][@"txt_n"] withImage:self.tianqiView.twoImageN isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:1][@"txt_n"] withImage:self.tianqiView.threeImageN isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:2][@"txt_n"] withImage:self.tianqiView.fourImageN isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:3][@"txt_n"] withImage:self.tianqiView.fiveImageN isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:4][@"txt_n"] withImage:self.tianqiView.sixImageN isDay:NO];
    
    
    NSString* adaf=[NSString stringWithFormat:@"%.1f",[content[@"yestoday"][@"min_tmp"] floatValue]];
    [self setTempLable:[NSString stringWithFormat:@"%@/%.1f",adaf,[content[@"yestoday"][@"max_tmp"] floatValue]] withLable:self.tianqiView.oneTempLable];
    self.tianqiView.oneTempLableR.text=@"o";
    [self setTempLable:[NSString stringWithFormat:@"%@/%@",[arrayConytent objectAtIndex:0][@"min_tmp"],[arrayConytent objectAtIndex:0][@"max_tmp"]] withLable:self.tianqiView.twoTempLable];
    self.tianqiView.twoTempLableR.text=@"o";
    [self setTempLable:[NSString stringWithFormat:@"%@/%@",[arrayConytent objectAtIndex:1][@"min_tmp"],[arrayConytent objectAtIndex:1][@"max_tmp"]] withLable:self.tianqiView.threeTempLable];
    self.tianqiView.threeTempLableR.text=@"o";
    [self setTempLable:[NSString stringWithFormat:@"%@/%@",[arrayConytent objectAtIndex:2][@"min_tmp"],[arrayConytent objectAtIndex:2][@"max_tmp"]] withLable:self.tianqiView.fourTempLable];
    self.tianqiView.fourTempLableR.text=@"o";
    [self setTempLable:[NSString stringWithFormat:@"%@/%@",[arrayConytent objectAtIndex:3][@"min_tmp"],[arrayConytent objectAtIndex:3][@"max_tmp"]] withLable:self.tianqiView.fiveTempLable];
    self.tianqiView.fiveTempLableR.text=@"o";
    [self setTempLable:[NSString stringWithFormat:@"%@/%@",[arrayConytent objectAtIndex:4][@"min_tmp"],[arrayConytent objectAtIndex:4][@"max_tmp"]] withLable:self.tianqiView.sixTempLable];
    self.tianqiView.sixTempLableR.text=@"o";
    [self.tianqiView recalView];
    
}

-(void)setImageWithConditon:(NSString*)cccc withImage:(UIImageView*)imageee isDay:(BOOL)isDad{
    
    if ([cccc isEqual:[NSNull null]]) {
        return;
    }
    
    if(cccc.length>0){
        if (isDad) {
            if ([cccc containsString:@"晴"]) {
                imageee.image=IMAGE(@"qingicon");
            }
            if ([cccc containsString:@"多云"]) {
                imageee.image=IMAGE(@"qingzhuanyuicon");
            }
        }else{
            if ([cccc containsString:@"晴"]) {
                imageee.image=IMAGE(@"qingnn");
            }
            if ([cccc containsString:@"多云"]) {
                imageee.image=IMAGE(@"duoyunicon");
            }
        }
        
        if ([cccc containsString:@"阴"]) {
            imageee.image=IMAGE(@"yinicon");
        }else if ([cccc containsString:@"小雪"]) {
            imageee.image=IMAGE(@"xiaoxueicon");
        }else if ([cccc containsString:@"中雪"]) {
            imageee.image=IMAGE(@"zhongxueicon");
        }else if ([cccc containsString:@"大雪"]) {
            imageee.image=IMAGE(@"daxueicon");
        }else if ([cccc containsString:@"暴雪"]) {
            imageee.image=IMAGE(@"baoxueicon");
        }else if ([cccc containsString:@"特大暴雪"]) {
            imageee.image=IMAGE(@"tedabaoxueicon");
        }else if ([cccc containsString:@"雷"]) {
            imageee.image=IMAGE(@"leiicon");
        }else if ([cccc containsString:@"雷阵雨"]) {
            imageee.image=IMAGE(@"leizhenyuicon");
        }
        else if ([cccc containsString:@"晴转雨"]) {
            imageee.image=IMAGE(@"qingzhuanyuicon");
        }
        else if ([cccc containsString:@"中雨"]) {
            imageee.image=IMAGE(@"zhongyuicon");
        }
        
        else if ([cccc containsString:@"大雨"]) {
            imageee.image=IMAGE(@"dayuicon");
        }
        
        else if ([cccc containsString:@"中雨"]) {
            imageee.image=IMAGE(@"zhongyuicon");
        }
        
        else if ([cccc containsString:@"阵雨"]) {
            imageee.image=IMAGE(@"zhenyuicon");
        }
        
        else if ([cccc containsString:@"阵雪"]) {
            imageee.image=IMAGE(@"zhenxueicon");
        }
        
        else if ([cccc containsString:@"雨"]) {
            imageee.image=IMAGE(@"yuicon");
        }else if ([cccc containsString:@"霾"]){
            imageee.image=IMAGE(@"wumaiicon");
            
        }else if ([cccc containsString:@"雾"]){
            imageee.image=IMAGE(@"wuicon");
        }
    }else{
        
    }
    
}
-(void)setTempLable:(NSString*)dads withLable:(UILabel*)adadad{
    adadad.text=dads;
}


-(void)setTimeBobao:(NSString*)time withLable:(UILabel*)lable withConditon1:(NSString*)cood withConditon2:(NSString*)adaf withLabel:(UILabel*)daff withTiqiLable:(UILabel*)tiqiLable{
    NSString* beforeWeek=[self getWeekByGivenTime:time];
    lable.text=beforeWeek;
    if (![cood isKindOfClass:[NSNull class]]) {
        
        daff.text=cood;
        
        tiqiLable.text=adaf;
    }
}

- (void)getWeek{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    NSInteger year=[comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    self.tianqiView.weekLable.text=[NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:[comps weekday] - 1]];
    self.tianqiView.timeLable.text=[NSString stringWithFormat:@"%ld年%ld月%ld日",year,month,day];
}

-(NSString*)getWeekByGivenTime:(NSString*)ADADAFA{
    NSDateFormatter * formrrr=[[NSDateFormatter alloc]init];
    [formrrr setDateFormat:@"yyyy-MM-dd"];
    NSDate* now= [formrrr dateFromString:ADADAFA];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:now];
    NSArray * arrWeek=[NSArray arrayWithObjects:@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六", nil];
    return  [NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:[comps weekday] - 1]];
    
}

-(void)getData{
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableDictionary* dictionary=[[NSMutableDictionary alloc]init];
    [dictionary setObject:@"50000" forKey:@"stationNum"];
    [[HardaHttpClient sharedClient] getDataWithUrl:tianQiUrl withParameters:dictionary deledate:self];
    [[HardaHttpClient sharedClient] getDataWithUrl:publishServiceUrl withParameters:dictionary deledate:self];
    [[HardaHttpClient sharedClient] getDataWithUrl:resetPassUrl withParameters:dictionary deledate:self];
    
}


#pragma mark - UMSocialShareMenuViewDelegate
- (void)UMSocialShareMenuViewDidAppear
{
    [self.rdv_tabBarController setTabBarHidden:YES];
}
- (void)UMSocialShareMenuViewDidDisappear
{
     [self.rdv_tabBarController setTabBarHidden:NO];
}

//不需要改变父窗口则不需要重写此协议
- (UIView*)UMSocialParentView:(UIView*)defaultSuperView
{
    return defaultSuperView;
}


#pragma mark HardaHttpDelegate
-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url{
    if ([url isEqual:tianQiUrl]) {
        [self initViewWithData:response];
        [SVProgressHUD dismiss];
    }else if([url isEqual:postImageUrl]){
        [SVProgressHUD dismiss];
        [self.tianqiZhanKai.locationImageView setHidden:YES];
        self.tianqiZhanKai.TEEE.text=@"今日看点";
        self.tianqiZhanKai.TEEE2.textColor=[UIColor whiteColor];
        self.tianqiZhanKai.TEEE1.text=response[@"datatime"];
        self.tianqiZhanKai.TEEE2.text=response[@"contents"];
        [self.tianqiZhanKai.TEEE2 sizeToFit];
        [self.tianqiZhanKai layoutSubviews];
    }else if([url isEqual:publishServiceUrl]){
        if ([[response allKeys] indexOfObject:@"alarm"]==NSNotFound) {
            [self.tianqiView.cityImage setHidden:YES];
            [self.tianqiView.cityButton setHidden:YES];
        }else{
            [self.tianqiView.cityImage setHidden:NO];
            [self.tianqiView.cityButton setHidden:NO];
        }
    }else{
        NSString* daf=response[@"AQI_class"];
        if (daf.length==3) {
            self.tianqiView.conditionLable.font=[UIFont systemFontOfSize:14];
        }else if(daf.length>=4){
            self.tianqiView.conditionLable.font=[UIFont systemFontOfSize:12];
        }
        self.tianqiView.conditionLable.text=daf;
        [self.tianqiView layoutSubviews];
    }
    
}
-(void)didFailLoadWithResponse:(NSDictionary*)response{
    [SVProgressHUD dismissWithError:response[@"MESSAGE"]];
}
-(void)didLoadTimeOut{
    [SVProgressHUD dismissWithError:@"网络请求超时,请稍后再试"];
}

#pragma mark TqViewDelegate
-(void)didLocationSelect{
    
    
}

-(void)didShareSelect{
    
    UIImage* image=[[UMSocialScreenShoterDefault screenShoter] getScreenShot];
    [self.rdv_tabBarController setTabBarHidden:YES];
//    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeImage;
//    [UMSocialData defaultData].extConfig.qqData.qqMessageType=UMSocialQQMessageTypeImage;
//    NSString* title=@"世园气象";
//    
//    [UMSocialSnsService presentSnsIconSheetView:self
//                                         appKey:UMENG_APPKEY
//                                      shareText:title
//                                     shareImage:image
//                                shareToSnsNames:@[UMShareToWechatSession,
//                                                  UMShareToWechatTimeline,
//                                                  UMShareToSina,
//                                                  UMShareToQQ,
//                                                  UMShareToSms]
//                                       delegate:self];
//    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = @"唐山气象";
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = image;
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        if (platformType==UMSocialPlatformType_Sms) {
            NSArray* arrayConytent= self.contentcOPU[@"daily_forecast"];
            NSString* cccccc=[[NSString alloc]init];
            for (NSInteger i=0; i<=2; i++) {
                NSDictionary* dadsf=[arrayConytent objectAtIndex:i];
                NSString* ddddd=[dadsf[@"date"] substringFromIndex:8];
                NSString* daty= dadsf[@"txt_d"];
                NSString* nighty= dadsf[@"txt_n"];
                if (![daty isEqual:nighty]) {
                    daty=[NSString stringWithFormat:@"%@转%@",daty,nighty];
                }
                
                NSString* daddccc=dadsf[@"min_tmp"];
                
                NSString* niggdccc=dadsf[@"max_tmp"];
                
                niggdccc=[NSString stringWithFormat:@"%@~%@℃;",daddccc,niggdccc];
                
                NSString* cddd= [NSString stringWithFormat:@"【%@日】%@ ,%@",ddddd,daty,niggdccc];
                cccccc=[NSString stringWithFormat:@"%@%@",cccccc,cddd];
            }
           messageObject.text = [NSString stringWithFormat:@"唐山：%@",cccccc];
           messageObject.shareObject=nil;
            
        }
        
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                NSLog(@"response data is %@",data);
            }
        }];

    }];
   
}


//-(void)didSelectSocialPlatform:(NSString *)platformName withSocialData:(UMSocialData *)socialData{
//    if ([platformName isEqual:UMShareToSms]) {
//        
//        NSArray* arrayConytent= self.contentcOPU[@"daily_forecast"];
//        
//        NSString* cccccc=[[NSString alloc]init];
//        for (NSInteger i=0; i<=2; i++) {
//            NSDictionary* dadsf=[arrayConytent objectAtIndex:i];
//            NSString* ddddd=[dadsf[@"date"] substringFromIndex:8];
//            NSString* daty= dadsf[@"txt_d"];
//            NSString* nighty= dadsf[@"txt_n"];
//            if (![daty isEqual:nighty]) {
//                daty=[NSString stringWithFormat:@"%@转%@",daty,nighty];
//            }
//            
//            NSString* daddccc=dadsf[@"min_tmp"];
//            
//            NSString* niggdccc=dadsf[@"max_tmp"];
//            
//            niggdccc=[NSString stringWithFormat:@"%@~%@℃;",daddccc,niggdccc];
//            
//            NSString* cddd= [NSString stringWithFormat:@"【%@日】%@ ,%@",ddddd,daty,niggdccc];
//            cccccc=[NSString stringWithFormat:@"%@%@",cccccc,cddd];
//        }
//        
//        socialData.shareImage=nil;
//        socialData.shareText=[NSString stringWithFormat:@"唐山：%@",cccccc];
//    }
//}
//
//-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response{
//    [self.rdv_tabBarController setTabBarHidden:NO];
//}
//
//-(void)didCloseUIViewController:(UMSViewControllerType)fromViewControllerType{
//    [self.rdv_tabBarController setTabBarHidden:NO];
//}
//


-(void)didZhanKaiSelect{
    [self.tianqiView setHidden:YES];
    [self.tianqiZhanKai setHidden:NO];
    [self.tianqiZhanKai INITwIDADAD:self.contentcOPU withCondition:self.tianqiView.conditionLable.text];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}


-(void)getdadfsfsf{
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    [[HardaHttpClient sharedClient] getDataWithUrl:postImageUrl withParameters:nil deledate:self];
}

-(void)dismissView{
    [self.tianqiView setHidden:NO];
    [self.tianqiZhanKai setHidden:YES];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

-(void)didShowTianQiYubao{
    TianqiYubaoViewController* conadfsf=[[TianqiYubaoViewController alloc]initWithNibName:nil bundle:nil];
    conadfsf.sNum=@"50000";
    conadfsf.sName=@"世园会";
    [self.navigationController pushViewController:conadfsf animated:YES];
}

-(void)didShowMain{
    
    CommonViewController* controller=[[CommonViewController alloc]initWithNibName:nil bundle:nil];
    controller.url=@"http://wx.hbweather.com.cn/jy_module/tsapp/syh.php";
    [self.navigationController pushViewController:controller animated:YES];
}


-(void)didSHOwSound{
    
//    if (self.isSpeaking) {
//        [self.speechSynthesizer cancelSpeaking];
//        self.isSpeaking=NO;
//        return;
//    }
//    
    self.musicPlayer.volume=0.8f;
    NSString* temp=[NSString stringWithFormat:@"%@",self.contentcOPU[@"now"][@"tmp"]];
    if ([temp floatValue]<0) {
        NSInteger dsdsf=temp.length;
        temp=[temp substringWithRange:NSMakeRange(1, dsdsf-1)];
        temp=[NSString stringWithFormat:@"零下%@",temp];
    }
    
    NSArray* arrayConytent= self.contentcOPU[@"daily_forecast"];
    NSString* cood=    [arrayConytent objectAtIndex:0][@"txt_d"];
    NSString* adaf=   [arrayConytent objectAtIndex:0][@"txt_n"];
    
    if (cood) {
        if (adaf) {
            if (![cood isEqualToString:adaf]) {
                cood=[NSString stringWithFormat:@"%@转%@",cood,adaf];
            }
        }
    }
    
    NSString* adf=  [NSString stringWithFormat:@":%@%@级:湿度:百分之%@",self.contentcOPU[@"now"][@"wind_dir_txt"],self.contentcOPU[@"now"][@"wind_sc"],self.contentcOPU[@"now"][@"hum"]];
    
    NSString * aDSF= [NSString stringWithFormat:@":气压: %@百帕",self.contentcOPU[@"now"][@"pres"]];
    NSString* adafs=[NSString stringWithFormat:@"气温:%@度:%@%@%@",temp,cood,adf,aDSF];
//    [self.speechSynthesizer speaking:adafs];
}


-(void)didShowYujing{
    YujingViewController* adaf=[[YujingViewController alloc]initWithNibName:nil bundle:nil];
    adaf.sName=@"世园会";
    adaf.sNum=@"50000";
    [self.navigationController pushViewController:adaf animated:YES];
}
@end
