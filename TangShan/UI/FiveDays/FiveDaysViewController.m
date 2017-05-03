//
//  FiveDaysViewController.m
//  TangShan
//
//  Created by chemi ios on 1/2/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "FiveDaysViewController.h"
#import "UUChart.h"
#import "FiveDayView.h"

@interface FiveDaysViewController ()<UUChartDataSource,UIScrollViewDelegate>

@property(strong,nonatomic)UUChart* chartView;

@property(strong,nonatomic)UUChart* chartViewY;

@property(strong,nonatomic)NSMutableArray* arrayXData;

@property(strong,nonatomic)NSMutableArray* arrayYData;

@property(assign,nonatomic) float highTemp;
@property(assign,nonatomic) float lowTemp;

@property(assign,nonatomic)  float lowFeng;
@property(assign,nonatomic)  float higeFeng;

@property(assign,nonatomic)NSInteger INDEXXX;

@property(strong,nonatomic)FiveDayView* fiveParentView;

@end

@implementation FiveDaysViewController

@synthesize mDictionary;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fiveParentView=[[FiveDayView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.fiveParentView];
    
    self.fiveParentView.mScrollView.delegate=self;
    
    self.fiveParentView.locationLable.text=self.sName;
    [self.fiveParentView.locationButton addTarget:self action:@selector(adsaFA) forControlEvents:UIControlEventTouchUpInside];
    self.fiveParentView.locationLable.text=[GloableInfo getLocationCityInfo][@"sName"];
    
    
    [self getData];
    
    NSInteger indexChoose=0;
    if (!self.isShiyuanhui) {
        NSString* dsdsaf= [GloableInfo getDefaultCityInfo][@"sName"];
        NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
        [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
        [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
        
        for(NSInteger i=0;i<ADSAFAF.count;i++){
            NSString* adaffaff=[ADSAFAF objectAtIndex:i][@"sName"];
            if([dsdsaf isEqual:adaffaff]){
                indexChoose=i;
                break;
            }
            
        }
        
    }
    [self.fiveParentView.mScrollView setContentOffset:CGPointMake(WIDETH*indexChoose, 0) animated:YES];
    [self SETsCJDDDDD:self.fiveParentView.mScrollView];
    
}

-(void)adsaFA{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    [self checkNeedReloadData];
    if (!self.isShiyuanhui) {
        NSString* adsf= self.fiveParentView.locationLable.text;
        if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
            self.fiveParentView.locationImageView.image=IMAGE(@"location");
        }else{
            self.fiveParentView.locationImageView.image=nil;
        }

    }
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSString* dsdsaf= self.fiveParentView.locationLable.text;
    
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


-(void)checkNeedReloadData{
    //    NSString* afaf=[[GloableInfo getDefaultCityInfo] objectForKey:@"sName"];
    //    NSString* adaf= self.fiveParentView.locationLable.text;
    //    if (![afaf isEqual:adaf]) {
    //        self.fiveParentView.locationLable.text=afaf;
    //        [self getData];
    //    }
}

#pragma mark Private Methods
-(NSDate*)getDateFromString:(NSString*)adadf{
    NSDateFormatter* ADAFFa=[[NSDateFormatter alloc]init];
    [ADAFFa setDateFormat:@"yyyyMMdd"];
    return [ADAFFa dateFromString:adadf];
}

-(void)setTimeBobao:(NSString*)time withLable:(UILabel*)lable withConditon1:(NSString*)cood withLabel:(UILabel*)daff{
    NSString* beforeWeek=[self getWeekByGivenTime:time];
    lable.text=beforeWeek;
    daff.text=cood;
}


-(void)setTimeBobao:(NSString*)cood withLabel:(UILabel*)daff{
    daff.text=cood;
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

-(void)setImageWithConditon:(NSString*)cccc withImage:(UIImageView*)imageee isDay:(BOOL)isDay{
    if ([cccc isEqual:[NSNull null]]) {
        return;
    }
    
    if(cccc.length>0){
        
        if (isDay) {
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

-(void)getData{
    
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    if (self.isShiyuanhui) {
        [ADSAFAF addObject:@{@"sName":self.sName,@"sNum":self.sNum}];
    }else{
        [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
        [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    }
    [self.fiveParentView.mScrollView setContentSize:CGSizeMake(WIDETH*ADSAFAF.count, HEIGHTH-44)];
    self.fiveParentView.mPageControl.numberOfPages=ADSAFAF.count;
    self.fiveParentView.mPageControl.currentPage=0;
    if ([self.fiveParentView.mScrollView subviews].count>0) {
        [self.fiveParentView.mScrollView removeAllSubviews];
    }
    self.fiveParentView.mScrollView.contentOffset=CGPointMake(0, 0);
    for (NSInteger index=0; index<ADSAFAF.count; index++) {
        FiveDaysView* adafsf=[[FiveDaysView alloc]initWithFrame:CGRectMake(index*WIDETH, 0, WIDETH, HEIGHTH-44)];
        adafsf.tag=index+1000;
        [self.fiveParentView.mScrollView addSubview:adafsf];
        if(index==0){
            [self getDataWithInfo:[ADSAFAF objectAtIndex:index]];
        }
    }
}

-(void)getDataWithInfo:(NSDictionary*)adaDSFASF{
    
    NSDictionary* adsFAFS=[GloableInfo getCacheInfo:adaDSFASF[@"sNum"]];
    NSMutableDictionary* dictionary=[[NSMutableDictionary alloc]init];
    [dictionary setObject:adaDSFASF[@"sNum"] forKey:@"stationNum"];
    if (adsFAFS) {
        NSInteger indexxxx= [self getTitleIndex]+1000;
        FiveDaysView* SDFF= (FiveDaysView*) [self.fiveParentView.mScrollView viewWithTag:indexxxx];
        [self initWithData:adsFAFS withView:SDFF];
        [SVProgressHUD dismiss];
    }else{
        [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
        [[HardaHttpClient sharedClient] getDataWithUrl:tianQiUrl withParameters:dictionary deledate:self];
    }
}

-(void)initWithData:(NSDictionary*)content withView:(FiveDaysView*)fiveDaysView{
    
    
    
    [self setTimeBobao:content[@"yestoday"][@"date"] withLable:fiveDaysView.onedayLable withConditon1:content[@"yestoday"][@"txt_d"] withLabel:fiveDaysView.onedayLableY];
    
    
    NSArray* arrayConytent= content[@"daily_forecast"];
    [self setTimeBobao:[arrayConytent objectAtIndex:0][@"date"] withLable:fiveDaysView.twodayLable withConditon1:[arrayConytent objectAtIndex:0][@"txt_d"]  withLabel:fiveDaysView.twodayLableY];
    
    
    
    [self setTimeBobao:[arrayConytent objectAtIndex:1][@"date"] withLable:fiveDaysView.threedayLable withConditon1:[arrayConytent objectAtIndex:1][@"txt_d"]  withLabel:fiveDaysView.threedayLableY];
    
    
    
    [self setTimeBobao:[arrayConytent objectAtIndex:2][@"date"] withLable:fiveDaysView.fourdayLable withConditon1:[arrayConytent objectAtIndex:2][@"txt_d"] withLabel:fiveDaysView.fourdayLableY];
    
    
    [self setTimeBobao:[arrayConytent objectAtIndex:3][@"date"] withLable:fiveDaysView.fivedayLable withConditon1:[arrayConytent objectAtIndex:3][@"txt_d"]  withLabel:fiveDaysView.fivedayLableY];
    
    
    [self setTimeBobao:[arrayConytent objectAtIndex:4][@"date"] withLable:fiveDaysView.sixdayLable withConditon1:[arrayConytent objectAtIndex:4][@"txt_d"]  withLabel:fiveDaysView.sixdayLableY];
    
    [self setTimeBobao:content[@"yestoday"][@"txt_n"] withLabel:fiveDaysView.onedayLableYY];
    [self setTimeBobao:[arrayConytent objectAtIndex:0][@"txt_n"]  withLabel:fiveDaysView.twodayLableYY];
    [self setTimeBobao:[arrayConytent objectAtIndex:1][@"txt_n"]  withLabel:fiveDaysView.threedayLableYY];
    [self setTimeBobao:[arrayConytent objectAtIndex:2][@"txt_n"] withLabel:fiveDaysView.fourdayLableYY];
    [self setTimeBobao:[arrayConytent objectAtIndex:3][@"txt_n"]  withLabel:fiveDaysView.fivedayLableYY];
    [self setTimeBobao:[arrayConytent objectAtIndex:4][@"txt_n"]  withLabel:fiveDaysView.sixdayLableYY];
    
    
    [self setImageWithConditon:content[@"yestoday"][@"txt_d"] withImage:fiveDaysView.oneImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:0][@"txt_d"] withImage:fiveDaysView.twoImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:1][@"txt_d"] withImage:fiveDaysView.threeImage  isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:2][@"txt_d"] withImage:fiveDaysView.fourImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:3][@"txt_d"] withImage:fiveDaysView.fiveImage isDay:YES];
    [self setImageWithConditon:[arrayConytent objectAtIndex:4][@"txt_d"] withImage:fiveDaysView.sixImage isDay:YES];
    
    
    
    [self setImageWithConditon:content[@"yestoday"][@"txt_n"] withImage:fiveDaysView.oneImageY  isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:0][@"txt_n"] withImage:fiveDaysView.twoImageY  isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:1][@"txt_n"] withImage:fiveDaysView.threeImageY  isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:2][@"txt_n"] withImage:fiveDaysView.fourImageY  isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:3][@"txt_n"] withImage:fiveDaysView.fiveImageY  isDay:NO];
    [self setImageWithConditon:[arrayConytent objectAtIndex:4][@"txt_n"] withImage:fiveDaysView.sixImageY  isDay:NO];
    
    
    NSString* adaf=[NSString stringWithFormat:@"%@",[NSNumber numberWithFloat:[content[@"yestoday"][@"min_tmp"] floatValue]]];
    [self setTimeBobao:[NSString stringWithFormat:@"%@/%@",adaf,[NSNumber numberWithFloat:[content[@"yestoday"][@"max_tmp"] floatValue]]] withLabel:fiveDaysView.onedayLableY1];
    [self setTimeBobao:[NSString stringWithFormat:@"%@/%@",[arrayConytent objectAtIndex:0][@"min_tmp"],[arrayConytent objectAtIndex:0][@"max_tmp"]]  withLabel:fiveDaysView.twodayLableY1];
    [self setTimeBobao:[NSString stringWithFormat:@"%@/%@",[arrayConytent objectAtIndex:1][@"min_tmp"],[arrayConytent objectAtIndex:1][@"max_tmp"]]  withLabel:fiveDaysView.threedayLableY1];
    [self setTimeBobao:[NSString stringWithFormat:@"%@/%@",[arrayConytent objectAtIndex:2][@"min_tmp"],[arrayConytent objectAtIndex:2][@"max_tmp"]] withLabel:fiveDaysView.fourdayLableY1];
    [self setTimeBobao:[NSString stringWithFormat:@"%@/%@",[arrayConytent objectAtIndex:3][@"min_tmp"],[arrayConytent objectAtIndex:3][@"max_tmp"]]  withLabel:fiveDaysView.fivedayLableY1];
    [self setTimeBobao:[NSString stringWithFormat:@"%@/%@",[arrayConytent objectAtIndex:4][@"min_tmp"],[arrayConytent objectAtIndex:4][@"max_tmp"]]  withLabel:fiveDaysView.sixdayLableY1];
    
    
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",content[@"yestoday"][@"wind_b_dir_txt"],content[@"yestoday"][@"wind_b_sc_txt"]] withLabel:fiveDaysView.onedayLableF1];
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",[arrayConytent objectAtIndex:0][@"wind_b_dir_txt"],[arrayConytent objectAtIndex:0][@"wind_b_sc_txt"]]  withLabel:fiveDaysView.twodayLableF1];
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",[arrayConytent objectAtIndex:1][@"wind_b_dir_txt"],[arrayConytent objectAtIndex:1][@"wind_b_sc_txt"]]  withLabel:fiveDaysView.threedayLableF1];
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",[arrayConytent objectAtIndex:2][@"wind_b_dir_txt"],[arrayConytent objectAtIndex:2][@"wind_b_sc_txt"]] withLabel:fiveDaysView.fourdayLableF1];
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",[arrayConytent objectAtIndex:3][@"wind_b_dir_txt"],[arrayConytent objectAtIndex:3][@"wind_b_sc_txt"]]  withLabel:fiveDaysView.fivedayLableF1];
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",[arrayConytent objectAtIndex:4][@"wind_b_dir_txt"],[arrayConytent objectAtIndex:4][@"wind_b_sc_txt"]]  withLabel:fiveDaysView.sixdayLableF1];
    
    
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",content[@"yestoday"][@"wind_e_dir_txt"],content[@"yestoday"][@"wind_e_sc_txt"]] withLabel:fiveDaysView.onedayLableF];
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",[arrayConytent objectAtIndex:0][@"wind_e_dir_txt"],[arrayConytent objectAtIndex:0][@"wind_e_sc_txt"]]  withLabel:fiveDaysView.twodayLableF];
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",[arrayConytent objectAtIndex:1][@"wind_e_dir_txt"],[arrayConytent objectAtIndex:1][@"wind_e_sc_txt"]]  withLabel:fiveDaysView.threedayLableF];
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",[arrayConytent objectAtIndex:2][@"wind_e_dir_txt"],[arrayConytent objectAtIndex:2][@"wind_e_sc_txt"]] withLabel:fiveDaysView.fourdayLableF];
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",[arrayConytent objectAtIndex:3][@"wind_e_dir_txt"],[arrayConytent objectAtIndex:3][@"wind_e_sc_txt"]]  withLabel:fiveDaysView.fivedayLableF];
    [self setTimeBobao:[NSString stringWithFormat:@"%@\n%@",[arrayConytent objectAtIndex:4][@"wind_e_dir_txt"],[arrayConytent objectAtIndex:4][@"wind_e_sc_txt"]]  withLabel:fiveDaysView.sixdayLableF];
    
    NSArray* arrray=  content[@"daily_forecast"];
    
    if (arrray.count==0) {
        return;
    }
    
    self.arrayXData=[[NSMutableArray alloc]initWithObjects:content[@"yestoday"][@"max_tmp"], nil];
    self.arrayYData=[[NSMutableArray alloc]initWithObjects:content[@"yestoday"][@"min_tmp"], nil];
    
    
    
    for (NSDictionary* asdff in arrray) {
        [self.arrayXData addObject:asdff[@"max_tmp"]];
    }
    
    for (NSDictionary* asdff in arrray) {
        [self.arrayYData addObject:asdff[@"min_tmp"]];
    }
    
    [self initWithChartView:fiveDaysView];
    
    
}
-(NSInteger)getTitleIndex{
    if (self.isShiyuanhui) {
        return 0;
    }else{
        NSString* adasfsafs=self.fiveParentView.locationLable.text;
        
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
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self SETsCJDDDDD:scrollView];
    
}

-(void)checkTitle:(NSString*)adsf{
    
    if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
        self.fiveParentView.locationImageView.image=IMAGE(@"location");
    }else{
        self.fiveParentView.locationImageView.image=nil;
    }
    self.fiveParentView.locationLable.text=adsf;
}

-(void)SETsCJDDDDD:(UIScrollView *)scrollView{
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    if (self.isShiyuanhui) {
        [ADSAFAF addObject:@{@"sName":self.sName,@"sNum":self.sNum}];
    }else{
        [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
        [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    }
    NSInteger indeddd=scrollView.contentOffset.x/WIDETH;
    self.fiveParentView.mPageControl.currentPage=indeddd;
    [self checkTitle:[ADSAFAF objectAtIndex:indeddd][@"sName"]];
    [self getDataWithInfo:[ADSAFAF objectAtIndex:indeddd]];
}

#pragma mark HardaHttpDelegate
-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url{
    
    NSInteger indexxxx=[self getTitleIndex];
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    if (self.isShiyuanhui) {
         [ADSAFAF addObject:@{@"sName":self.sName,@"sNum":self.sNum}];
    }else{
        [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
        [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    }
   
    [GloableInfo setCacheInfo:[ADSAFAF objectAtIndex:indexxxx][@"sNum"] withContent:response];
    FiveDaysView* SDFF= (FiveDaysView*) [self.fiveParentView.mScrollView viewWithTag:indexxxx+1000];
    [self initWithData:response withView:SDFF];
    [SVProgressHUD dismiss];
    
    
}
-(void)didFailLoadWithResponse:(NSDictionary*)response{
    [SVProgressHUD dismissWithError:response[@"MESSAGE"]];
}
-(void)didLoadTimeOut{
    [SVProgressHUD dismissWithError:@"网络请求超时,请稍后再试"];
}


-(void)initWithChartView:(FiveDaysView*)fiveDaysView{
    
    self.highTemp=[self getcONTT:self.arrayXData isMax:YES];
    self.lowTemp=[self getcONTT:self.arrayXData isMax:NO];
    
    self.highTemp= self.highTemp+ (self.highTemp-self.lowTemp)/2+1;
    self.lowTemp=self.lowTemp- (self.highTemp-self.lowTemp)/2-1;
    
    
    self.higeFeng=[self getcONTT:self.arrayYData isMax:YES];
    self.lowFeng=[self getcONTT:self.arrayYData isMax:NO];
    
    self.higeFeng=self.higeFeng+(self.higeFeng-self.lowFeng)/2+1;
    self.lowFeng=self.lowFeng-(self.higeFeng-self.lowFeng)/2-1;
    
    self.INDEXXX=1;
    
    if (self.chartView) {
        [self.chartView removeFromSuperview];
        
        self.chartView = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(-40, fiveDaysView.oneImage.bottom+140, [UIScreen mainScreen].bounds.size.width+50, 100)
                                                       withSource:self
                                                        withStyle:UUChartStyleLine
                                                        withColor:0
                                                  withIndexChoose:0
                          ];
    }else{
        
        self.chartView = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(-40, fiveDaysView.oneImage.bottom+180, [UIScreen mainScreen].bounds.size.width+50, 100)
                                                       withSource:self
                                                        withStyle:UUChartStyleLine
                                                        withColor:0
                                                  withIndexChoose:0
                          ];
        
    }
    
    
    self.chartView.count=self.arrayXData.count;
    
    [self.chartView showInView:fiveDaysView];
    
    
    self.INDEXXX=2;
    
    
    if (self.chartViewY) {
        [self.chartViewY removeFromSuperview];
        self.chartViewY = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(self.chartView.frame.origin.x, self.chartView.frame.origin.y+70, self.chartView.frame.size.width, 100)
                                                        withSource:self
                                                         withStyle:UUChartStyleLine
                                                         withColor:1
                                                   withIndexChoose:0];
        
    }else{
        self.chartViewY = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(self.chartView.frame.origin.x, self.chartView.frame.origin.y+100, self.chartView.frame.size.width, 100)
                                                        withSource:self
                                                         withStyle:UUChartStyleLine
                                                         withColor:1
                                                   withIndexChoose:0];
        
    }
    
    
    self.chartViewY.count=self.arrayXData.count;
    
    [self.chartViewY showInView:fiveDaysView];
    
    
}

#pragma mark - @required

-(CGFloat)getcONTT:(NSArray*)array isMax:(BOOL)isMax{
    CGFloat adafsaf=[[array objectAtIndex:0] floatValue];
    for (NSInteger i=1; i<array.count; i++) {
        CGFloat ADAff= [[array objectAtIndex:i] floatValue];
        
        if (isMax) {
            if (ADAff>adafsaf) {
                adafsaf=ADAff;
            }
        }else{
            if (ADAff<adafsaf) {
                adafsaf=ADAff;
            }
        }
    }
    return adafsaf;
}

- (NSArray *)getXTitles:(NSInteger)num
{
    NSMutableArray *xTitles = [NSMutableArray array];
    for (int i=0; i<num; i++) {
        NSString * str = [NSString stringWithFormat:@"R-%d",i];
        [xTitles addObject:str];
    }
    return xTitles;
}

//横坐标标题数组
- (NSArray *)chartConfigAxisXLabel:(UUChart *)chart
{
    return [self getXTitles:self.arrayXData.count];
}
//数值多重数组
- (NSArray *)chartConfigAxisYValue:(UUChart *)chart
{
    if (self.INDEXXX==1) {
        return @[self.arrayXData];
    }else{
        return @[self.arrayYData];
    }
    
}

#pragma mark - @optional
//颜色数组
- (NSArray *)chartConfigColors:(UUChart *)chart
{
    return @[[UUColor green],[UUColor red],[UUColor brown]];
}
//显示数值范围
- (CGRange)chartRange:(UUChart *)chart
{
    if (self.INDEXXX==1) {
        return CGRangeMake(self.highTemp, self.lowTemp);
    }else{
        return CGRangeMake(self.higeFeng, self.lowFeng);
    }
    
}

#pragma mark 折线图专享功能

//标记数值区域
- (CGRange)chartHighlightRangeInLine:(UUChart *)chart
{
    
    return CGRangeZero;
}

//判断显示横线条
- (BOOL)chart:(UUChart *)chart showHorizonLineAtIndex:(NSInteger)index
{
    return YES;
}

//判断显示最大最小值
- (BOOL)chart:(UUChart *)chart showMaxMinAtIndex:(NSInteger)index
{
    return YES;
}

@end
