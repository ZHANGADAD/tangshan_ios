//
//  TianqiViewController.m
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "TianqiViewController.h"
#import "SyhView.h"
#import "TqZhanKaiView.h"
#import "RDVTabBarController.h"
#import "TianqiYubaoViewController.h"
#import "YujingViewController.h"
#import "CitySettingsViewController.h"
#import "TiqiContentView.h"
#import "FiveDaysViewController.h"
#import "KongqiViewController.h"
#import "TTSConfig.h"


@interface TianqiViewController ()<HardaHttpClientDelegate,UIScrollViewDelegate,SyhViewDelegate,TqZhanKaiViewDelegate,TqViewDelegate,UMSocialShareMenuViewDelegate,IFlySpeechSynthesizerDelegate>

@property(strong,nonatomic)NSDictionary* contentcOPU;
@property(strong,nonatomic)SyhView* tianqiView;
@property(strong,nonatomic)TqZhanKaiView* tianqiZhanKai;
@property(assign,nonatomic)BOOL isSpeaking;
@property (nonatomic, strong) IFlySpeechSynthesizer * iFlySpeechSynthesizer;
@end

@implementation TianqiViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tianqiView=[[SyhView alloc]initWithFrame:self.view.frame];
    self.tianqiView.backGroudView.image=IMAGE(@"bg");
    [self.view addSubview:self.tianqiView];
    self.tianqiView.delegate=self;
    self.tianqiView.afdsafsafdsgsagsagd.delegate=self;
    [self initShare];
    
    [self.tianqiView.conditionButton addTarget:self action:@selector(afafsdfssg) forControlEvents:UIControlEventTouchUpInside];
    
    self.tianqiZhanKai=[[TqZhanKaiView alloc]initWithFrame:self.view.frame];
    self.tianqiZhanKai.delegate=self;
    [self.view addSubview:self.tianqiZhanKai];
    [self.tianqiZhanKai setHidden:YES];
    
    self.tianqiView.locationLable.text=[GloableInfo getLocationCityInfo][@"sName"];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initYuYin];
    [self checkTitle: self.tianqiView.locationLable.text];
    [self getData];
    
    NSString* dsdsaf= [GloableInfo getDefaultCityInfo][@"sName"];
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSInteger indexChoose=0;
    for(NSInteger i=0;i<ADSAFAF.count;i++){
        NSString* adaffaff=[ADSAFAF objectAtIndex:i][@"sName"];
        if([dsdsaf isEqual:adaffaff]){
            indexChoose=i;
            break;
        }
        
    }
    [self.tianqiView.afdsafsafdsgsagsagd setContentOffset:CGPointMake(WIDETH*indexChoose, 0) animated:YES];
    [self SETsCJDDDDD:self.tianqiView.afdsafsafdsgsagsagd];
}

-(void)afafsdfssg{
    
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSInteger indexxx=  [self getTitleIndex];
    KongqiViewController* connnn=[[KongqiViewController alloc]initWithNibName:nil bundle:nil];
    connnn.sName=[ADSAFAF objectAtIndex:indexxx][@"sName"];
    connnn.sNum=[ADSAFAF objectAtIndex:indexxx][@"sNum"];
    [self.navigationController pushViewController:connnn animated:YES];
}


-(void)reeefreshData:(NSDictionary*)adsf{
    [GloableInfo setDefaultCityInfo:adsf[@"sName"] withStationNum:adsf[@"sNum"]];
    self.tianqiView.locationLable.text=adsf[@"sName"];
}

-(void)AASFSGSGG{
    [self.tianqiView.afdsafsafdsgsagsagd setContentOffset:CGPointMake(WIDETH, 0) animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.isSpeaking=NO;
    [_iFlySpeechSynthesizer stopSpeaking];
    NSString* dsdsaf= self.tianqiView.locationLable.text;
    
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSInteger indexChoose=-1;
    for(NSInteger i=0;i<ADSAFAF.count;i++){
        NSString* adaffaff=[ADSAFAF objectAtIndex:i][@"sName"];
        if([dsdsaf isEqual:adaffaff]){
            indexChoose=i;
            break;
        }
        
    }
    if (indexChoose!=-1) {
        [GloableInfo setDefaultCityInfo:[ADSAFAF objectAtIndex:indexChoose][@"sName"] withStationNum:[ADSAFAF objectAtIndex:indexChoose][@"sNum"]];
    }
    
}

-(void)dismissView{
    [self.tianqiView setHidden:NO];
    [self.tianqiZhanKai setHidden:YES];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}


-(void)initYuYin{
    TTSConfig *instance = [TTSConfig sharedInstance];
    if (instance == nil) {
        return;
    }
    self.isSpeaking=YES;
    //合成服务单例
    if (_iFlySpeechSynthesizer == nil) {
        _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    }
    
    _iFlySpeechSynthesizer.delegate = self;
    
    //设置语速1-100
    [_iFlySpeechSynthesizer setParameter:instance.speed forKey:[IFlySpeechConstant SPEED]];
    
    //设置音量1-100
    [_iFlySpeechSynthesizer setParameter:instance.volume forKey:[IFlySpeechConstant VOLUME]];
    
    //设置音调1-100
    [_iFlySpeechSynthesizer setParameter:instance.pitch forKey:[IFlySpeechConstant PITCH]];
    
    //设置采样率
    [_iFlySpeechSynthesizer setParameter:instance.sampleRate forKey:[IFlySpeechConstant SAMPLE_RATE]];
    
    //设置发音人
    [_iFlySpeechSynthesizer setParameter:instance.vcnName forKey:[IFlySpeechConstant VOICE_NAME]];
    
    //设置文本编码格式
    [_iFlySpeechSynthesizer setParameter:@"unicode" forKey:[IFlySpeechConstant TEXT_ENCODING]];
    
    
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


-(void)getDataWithInfo:(NSDictionary*)adaDSFASF{
    
    NSDictionary* adsFAFS=[GloableInfo getCacheInfo:adaDSFASF[@"sNum"]];
    NSMutableDictionary* dictionary=[[NSMutableDictionary alloc]init];
    [dictionary setObject:adaDSFASF[@"sNum"] forKey:@"stationNum"];
    if ([[adsFAFS allKeys] indexOfObject:@"daily_forecast"]==NSNotFound) {
        [GloableInfo setCacheInfo:adaDSFASF[@"sNum"] withContent:nil];
        adsFAFS=nil;
        
    }
    if (adsFAFS) {
        NSInteger indexxxx= [self getTitleIndex]+1000;
        TiqiContentView* SDFF= (TiqiContentView*) [self.tianqiView.afdsafsafdsgsagsagd viewWithTag:indexxxx];
        [self initViewWithData:adsFAFS withView:SDFF];
    }else{
        [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
        [[HardaHttpClient sharedClient] getDataWithUrl:tianQiUrl withParameters:dictionary deledate:self];
        
    }
    [[HardaHttpClient sharedClient] getDataWithUrl:publishServiceUrl withParameters:dictionary deledate:self];
    [[HardaHttpClient sharedClient] getDataWithUrl:resetPassUrl withParameters:dictionary deledate:self];
    
}

-(NSInteger)getTitleIndex{
    NSString* adasfsafs=self.tianqiView.locationLable.text;
    
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSInteger ADSAFSF=0;
    for (NSInteger daff=0; daff<ADSAFAF.count; daff++) {
        NSDictionary* adAfsafasf=[ADSAFAF objectAtIndex:daff];
        if ([adAfsafasf[@"sName"] isEqualToString:adasfsafs]) {
            ADSAFSF=daff;
        }
    }
    
    return ADSAFSF;
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


#pragma mark HardaHttpDelegate
-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url{
    NSInteger indexxxx=[self getTitleIndex];
    if ([url isEqual:tianQiUrl]) {
        NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
        [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
        [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
        [GloableInfo setCacheInfo:[ADSAFAF objectAtIndex:indexxxx][@"sNum"] withContent:response];
        TiqiContentView* SDFF= (TiqiContentView*) [self.tianqiView.afdsafsafdsgsagsagd viewWithTag:indexxxx+1000];
        [self initViewWithData:response withView:SDFF];
        [SVProgressHUD dismiss];
    }else if([url isEqual:publishServiceUrl]){
        NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
        [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
        [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
        [GloableInfo setCacheInfo:[ADSAFAF objectAtIndex:indexxxx][@"sNum"] withContent:response];
        TiqiContentView* SDFF= (TiqiContentView*) [self.tianqiView.afdsafsafdsgsagsagd viewWithTag:indexxxx+1000];
        if ([[response allKeys] indexOfObject:@"alarm"]==NSNotFound) {
            [SDFF.cityImage setHidden:YES];
            [SDFF.cityButton setHidden:YES];
        }else{
            [SDFF.cityImage setHidden:NO];
            [SDFF.cityButton setHidden:NO];
        }
    }else{
        NSString* daf=response[@"AQI_class"];
        if (daf.length==3) {
            self.tianqiView.conditionLable.font=[UIFont systemFontOfSize:14];
        }else if(daf.length>=4){
            self.tianqiView.conditionLable.font=[UIFont systemFontOfSize:12];
        }
        self.tianqiView.conditionLable.text=daf;
    }
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

- (void)getWeek:(TiqiContentView*)contentView{
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
    contentView.weekLable.text=[NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:[comps weekday] - 1]];
    contentView.timeLable.text=[NSString stringWithFormat:@"%ld年%ld月%ld日",year,month,day];
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


-(void)initViewWithData:(NSDictionary*)content withView:(TiqiContentView*)contentView{
    [SVProgressHUD dismiss];
    self.contentcOPU=content;
    NSString* adaF=[content[@"daily_forecast"] objectAtIndex:0][@"txt_n"];
    if (adaF) {
        if ([adaF containsString:@"晴"]) {
            self.tianqiView.ADFF.image=IMAGE(@"qingbg");
        }else if ([adaF containsString:@"阴"]){
            self.tianqiView.ADFF.image=IMAGE(@"yintianbg");
        }else if ([adaF containsString:@"多云"]){
            self.tianqiView.ADFF.image=IMAGE(@"duoyunbg");
        }else if ([adaF containsString:@"雨"]){
            self.tianqiView.ADFF.image=IMAGE(@"yubg");
        }else if ([adaF containsString:@"雪"]){
            self.tianqiView.ADFF.image=IMAGE(@"xuebg");
        }else if ([adaF containsString:@"雷"]){
            self.tianqiView.ADFF.image=IMAGE(@"leibg");
        }else if ([adaF containsString:@"雾霾"]){
            self.tianqiView.ADFF.image=IMAGE(@"wumaibg");
        }else if ([adaF containsString:@"雾"]){
            self.tianqiView.ADFF.image=IMAGE(@"wu");
        }
        
    }
    [self getWeek:contentView];
    contentView.cityLable.text=content[@"basic"][@"stationName"];
    
    if (![content[@"now"][@"tmp"] isKindOfClass:[NSNull class]]) {
        NSString* adADA= [NSString stringWithFormat:@"%.1f",[content[@"now"][@"tmp"] floatValue]];
        contentView.tempLabel.text=adADA;
    }
    
    
    if (![adaF isEqual:[NSNull null]]) {
        contentView.tempQingyinLable.text=adaF;
    }
    
    contentView.fengxiangLable.text=[NSString stringWithFormat:@"%@%@级 湿度 %@%%",content[@"now"][@"wind_dir_txt"],content[@"now"][@"wind_sc"],content[@"now"][@"hum"]];
    
    contentView.tempLabelUnit.text=@"o";
    contentView.qiyaLable.text= [NSString stringWithFormat:@"气压: %@hpa",content[@"now"][@"pres"]];
    //yestody
    self.tianqiView.yubaoLable.text=@"预报";
    
    [self setTimeBobao:content[@"yestoday"][@"date"] withLable:contentView.onedayLable withConditon1:content[@"yestoday"][@"txt_d"] withConditon2:content[@"yestoday"][@"txt_n"] withLabel:contentView.onedayLableY withTiqiLable:contentView.onedayLableYN];
    
    NSArray* arrayConytent= content[@"daily_forecast"];
    [self setTimeBobao:[arrayConytent objectAtIndex:0][@"date"] withLable:contentView.twodayLable withConditon1:[arrayConytent objectAtIndex:0][@"txt_d"] withConditon2:[arrayConytent objectAtIndex:0][@"txt_n"] withLabel:contentView.twodayLableY withTiqiLable:contentView.twodayLableYN];
    
    [self setTimeBobao:[arrayConytent objectAtIndex:1][@"date"] withLable:contentView.threedayLable withConditon1:[arrayConytent objectAtIndex:1][@"txt_d"] withConditon2:[arrayConytent objectAtIndex:1][@"txt_n"] withLabel:contentView.threedayLableY withTiqiLable:contentView.threedayLableYN];
    
    
    [self setTimeBobao:[arrayConytent objectAtIndex:2][@"date"] withLable:contentView.fourdayLable withConditon1:[arrayConytent objectAtIndex:2][@"txt_d"] withConditon2:[arrayConytent objectAtIndex:2][@"txt_n"] withLabel:contentView.fourdayLableY withTiqiLable:contentView.fourdayLableYN];
    
    [self setTimeBobao:[arrayConytent objectAtIndex:3][@"date"] withLable:contentView.fivedayLable withConditon1:[arrayConytent objectAtIndex:3][@"txt_d"] withConditon2:[arrayConytent objectAtIndex:3][@"txt_n"] withLabel:contentView.fivedayLableY withTiqiLable:contentView.fivedayLableYN];
    
    [self setTimeBobao:[arrayConytent objectAtIndex:4][@"date"] withLable:contentView.sixdayLable withConditon1:[arrayConytent objectAtIndex:4][@"txt_d"] withConditon2:[arrayConytent objectAtIndex:4][@"txt_n"] withLabel:contentView.sixdayLableY withTiqiLable:contentView.sixdayLableYN];
    
    [self setImageWithConditon:content[@"yestoday"][@"txt_d"] withImage:contentView.oneImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:0][@"txt_d"] withImage:contentView.twoImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:1][@"txt_d"] withImage:contentView.threeImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:2][@"txt_d"] withImage:contentView.fourImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:3][@"txt_d"] withImage:contentView.fiveImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:4][@"txt_d"] withImage:contentView.sixImage isDay:YES];
    
    [self setImageWithConditon:content[@"yestoday"][@"txt_n"] withImage:contentView.oneImageN isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:0][@"txt_n"] withImage:contentView.twoImageN isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:1][@"txt_n"] withImage:contentView.threeImageN isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:2][@"txt_n"] withImage:contentView.fourImageN isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:3][@"txt_n"] withImage:contentView.fiveImageN isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:4][@"txt_n"] withImage:contentView.sixImageN isDay:NO];
    
    NSString* adaf=[NSString stringWithFormat:@"%.1f",[content[@"yestoday"][@"min_tmp"] floatValue]];
    [self setTempLable:[NSString stringWithFormat:@"%@/%.1f",adaf,[content[@"yestoday"][@"max_tmp"] floatValue]] withLable:contentView.oneTempLable];
    contentView.oneTempLableR.text=@"o";
    [self setTempLable:[NSString stringWithFormat:@"%@/%@",[NSNumber numberWithDouble:[[arrayConytent objectAtIndex:0][@"min_tmp"] doubleValue]],[NSNumber numberWithDouble:[[arrayConytent objectAtIndex:0][@"max_tmp"] doubleValue]]] withLable:contentView.twoTempLable];
    contentView.twoTempLableR.text=@"o";
    [self setTempLable:[NSString stringWithFormat:@"%@/%@",[NSNumber numberWithDouble:[[arrayConytent objectAtIndex:1][@"min_tmp"] doubleValue]],[NSNumber numberWithDouble:[[arrayConytent objectAtIndex:1][@"max_tmp"] doubleValue]]] withLable:contentView.threeTempLable];
    contentView.threeTempLableR.text=@"o";
    [self setTempLable:[NSString stringWithFormat:@"%@/%@",[NSNumber numberWithDouble:[[arrayConytent objectAtIndex:2][@"min_tmp"] doubleValue]],[NSNumber numberWithDouble:[[arrayConytent objectAtIndex:2][@"max_tmp"] doubleValue]]] withLable:contentView.fourTempLable];
    contentView .fourTempLableR.text=@"o";
    [self setTempLable:[NSString stringWithFormat:@"%@/%@",[NSNumber numberWithDouble:[[arrayConytent objectAtIndex:3][@"min_tmp"] doubleValue]],[NSNumber numberWithDouble:[[arrayConytent objectAtIndex:3][@"max_tmp"] doubleValue]]] withLable:contentView.fiveTempLable];
    contentView.fiveTempLableR.text=@"o";
    [self setTempLable:[NSString stringWithFormat:@"%@/%@",[NSNumber numberWithDouble:[[arrayConytent objectAtIndex:4][@"min_tmp"] doubleValue]],[NSNumber numberWithDouble:[[arrayConytent objectAtIndex:4][@"max_tmp"] doubleValue]]] withLable:contentView.sixTempLable];
    contentView.sixTempLableR.text=@"o";
    [contentView recalView];
    
}


-(void)didFailLoadWithResponse:(NSDictionary*)response{
    [SVProgressHUD dismissWithError:response[@"MESSAGE"]];
}
-(void)didLoadTimeOut{
    [SVProgressHUD dismissWithError:@"网络请求超时,请稍后再试"];
}

-(void)getData{
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    [self.tianqiView.afdsafsafdsgsagsagd setContentSize:CGSizeMake(WIDETH*ADSAFAF.count, HEIGHTH-44)];
    self.tianqiView.adsaFFSAF.numberOfPages=ADSAFAF.count;
    self.tianqiView.adsaFFSAF.currentPage=0;
    if ([self.tianqiView.afdsafsafdsgsagsagd subviews].count>0) {
        [self.tianqiView.afdsafsafdsgsagsagd removeAllSubviews];
    }
    self.tianqiView.afdsafsafdsgsagsagd.contentOffset=CGPointMake(0, 0);
    for (NSInteger index=0; index<ADSAFAF.count; index++) {
        TiqiContentView* adafsf=[[TiqiContentView alloc]initWithFrame:CGRectMake(index*WIDETH, 0, WIDETH, HEIGHTH-44)];
        adafsf.delegate=self;
        adafsf.tag=index+1000;
        [self.tianqiView.afdsafsafdsgsagsagd addSubview:adafsf];
        if(index==0){
            [self getDataWithInfo:[ADSAFAF objectAtIndex:index]];
        }
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self SETsCJDDDDD:scrollView];
    
}

-(void)SETsCJDDDDD:(UIScrollView *)scrollView{
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSInteger indeddd=scrollView.contentOffset.x/WIDETH;
    self.tianqiView.adsaFFSAF.currentPage=indeddd;
    [self checkTitle:[ADSAFAF objectAtIndex:indeddd][@"sName"]];
    [self getDataWithInfo:[ADSAFAF objectAtIndex:indeddd]];
}

-(void)checkTitle:(NSString*)adsf{
    
    //    if([[GloableInfo getDefaultCityInfo][@"sName"] isEqual:[GloableInfo getLocationCityInfo][@"sName"]]){
    //         self.tianqiView.locationImageView.image=IMAGE(@"homdadee");
    //    }else if ([adsf isEqualToString:[GloableInfo getDefaultCityInfo][@"sName"]]) {
    //        self.tianqiView.locationImageView.image=IMAGE(@"homdadee");
    //    }else if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
    //        self.tianqiView.locationImageView.image=IMAGE(@"location");
    //    }else{
    //        self.tianqiView.locationImageView.image=nil;
    //    }
    if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
        self.tianqiView.locationImageView.image=IMAGE(@"location");
    }else{
        self.tianqiView.locationImageView.image=nil;
    }
    self.tianqiView.locationLable.text=adsf;
}


-(void)didShareSelect{
    
    UIImage* image=[[UMSocialScreenShoterDefault screenShoter] getScreenShot];
    [self.rdv_tabBarController setTabBarHidden:YES];
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = self.tianqiView.locationLable.text;
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.shareImage = image;
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
            messageObject.text = [NSString stringWithFormat:@"%@：%@",self.tianqiView.locationLable.text,cccccc];
            messageObject.shareObject=nil;
            
        }
        
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                NSLog(@"response data is %@",data);
                [self.rdv_tabBarController setTabBarHidden:NO];
            }
        }];
        
    }];
    
}


-(NSDictionary*)getChooseData{
    
    NSInteger indexTab= [self getTitleIndex];
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSDictionary* adaDSFASF=[ADSAFAF objectAtIndex:indexTab];
    NSDictionary* adsFAFS=[GloableInfo getCacheInfo:adaDSFASF[@"sNum"]];
    return adsFAFS;
    
}

-(void)didZhanKaiSelect{
    //天气详情
    self.tianqiZhanKai.locationLable.text=self.tianqiView.locationLable.text;
    [self.tianqiView setHidden:YES];
    [self.tianqiZhanKai setHidden:NO];
    [self.tianqiZhanKai INITwIDADAD:[self getChooseData] withCondition:self.tianqiView.conditionLable.text];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
}


-(void)didShowTianQiYubao{
    //
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSInteger indexTab= [self getTitleIndex];
    
    
    
    FiveDaysViewController* adaf=[[FiveDaysViewController alloc]initWithNibName:nil bundle:nil];
    adaf.sName=[ADSAFAF objectAtIndex:indexTab][@"sName"];
    adaf.sNum=[ADSAFAF objectAtIndex:indexTab][@"sNum"];
    
    [self.navigationController pushViewController:adaf animated:YES];
    
}

-(void)didShowMain{
    
    CitySettingsViewController* adf=[[CitySettingsViewController alloc]initWithNibName:nil
                                                                                bundle:nil];
    [self.navigationController pushViewController:adf animated:YES];
}

-(void)didSHOwSound{
    if (_iFlySpeechSynthesizer.isSpeaking)
        return;
    //
    NSDictionary* ADfffa=[self getChooseData];
    NSString* temp=[NSString stringWithFormat:@"%@",ADfffa[@"now"][@"tmp"]];
    if ([temp floatValue]<0) {
        NSInteger dsdsf=temp.length;
        temp=[temp substringWithRange:NSMakeRange(1, dsdsf-1)];
        temp=[NSString stringWithFormat:@"零下%@",temp];
    }
    
    NSArray* arrayConytent=ADfffa[@"daily_forecast"];
    NSString* cood=    [arrayConytent objectAtIndex:0][@"txt_d"];
    NSString* adaf=   [arrayConytent objectAtIndex:0][@"txt_n"];
    
    if (cood) {
        if (adaf) {
            if (![cood isEqualToString:adaf]) {
                cood=[NSString stringWithFormat:@"%@转%@",cood,adaf];
            }
        }
    }
    
    NSString* adf=  [NSString stringWithFormat:@":%@%@级:湿度:百分之%@",ADfffa[@"now"][@"wind_dir_txt"],ADfffa[@"now"][@"wind_sc"],ADfffa[@"now"][@"hum"]];
    
    NSString * aDSF= [NSString stringWithFormat:@":气压: %@百帕",ADfffa[@"now"][@"pres"]];
    NSString* adafs=[NSString stringWithFormat:@"气温:%@度:%@%@%@",temp,cood,adf,aDSF];
    [_iFlySpeechSynthesizer startSpeaking:adafs];
}

#pragma mark IFlySpeechSynthesizerDelegate

/*!
 *  结束回调<br>
 *  当整个合成结束之后会回调此函数
 *
 *  @param error 错误码
 */
- (void) onCompleted:(IFlySpeechError*) error{
    self.isSpeaking=NO;
}

/*!
 *  开始合成回调
 */
- (void) onSpeakBegin{
    self.isSpeaking=YES;
}

-(void)didShowYujing{
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSInteger indexTab= [self getTitleIndex];
    
    
    YujingViewController* adaf=[[YujingViewController alloc]initWithNibName:nil bundle:nil];
    adaf.sName=[ADSAFAF objectAtIndex:indexTab][@"sName"];
    adaf.sNum=[ADSAFAF objectAtIndex:indexTab][@"sNum"];
    [self.navigationController pushViewController:adaf animated:YES];
    
}

-(void)showZhexian{
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSInteger indexTab= [self getTitleIndex];
    
    
    TianqiYubaoViewController* adaf=[[TianqiYubaoViewController alloc]initWithNibName:nil bundle:nil];
    adaf.sName=[ADSAFAF objectAtIndex:indexTab][@"sName"];
    adaf.sNum=[ADSAFAF objectAtIndex:indexTab][@"sNum"];
    
    [self.navigationController pushViewController:adaf animated:YES];
    
    
}
@end
