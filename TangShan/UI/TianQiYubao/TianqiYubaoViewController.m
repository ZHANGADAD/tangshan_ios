//
//  TianqiYubaoViewController.m
//  TangShan
//
//  Created by chemi ios on 1/1/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TianqiYubaoViewController.h"
#import "UUChart.h"
#import "UUChartLabel.h"
#import "TianqiContentView.h"

@interface TianqiYubaoViewController ()<UUChartDataSource,UIScrollViewDelegate,HMSegmentedControlDelegate>

@property(strong,nonatomic)UUChart* chartView;

@property(strong,nonatomic)NSMutableArray* arrayYData;

@property(strong,nonatomic)NSMutableArray* arrayDate;

@property(assign,nonatomic) float highTemp;
@property(assign,nonatomic) float lowTemp;

@property(strong,nonatomic)NSDictionary* preDictionary;


@property(strong,nonatomic)NSDictionary* currentDictionary;

@property(assign,nonatomic)NSInteger INDEXXX;

@property(assign,nonatomic)NSInteger indexX;
@property(assign,nonatomic)NSInteger indexY;

@end

@implementation TianqiYubaoViewController
@synthesize dictionary;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tianQiYubaoView=[[TiqiYubaoView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.tianQiYubaoView];
    self.tianQiYubaoView.locationLable.text=self.sName;
    [self.tianQiYubaoView.locationButton addTarget:self action:@selector(ADAFS) forControlEvents:UIControlEventTouchUpInside];
    self.tianQiYubaoView.mScrollView.delegate=self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self checkTitle: self.tianQiYubaoView.locationLable.text];
    [self getData];
}


-(void)segementDidSelect:(NSInteger)index withSegeMent:(HMSegmentedControl *)segementControl{
    
    NSInteger indexxxx=[self getTitleIndex];
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    TianqiContentView* SDFF= (TianqiContentView*) [self.tianQiYubaoView.mScrollView viewWithTag:indexxxx+1000];
    
    if(self.isFuture){
        self.indexX=index;
        [self.chartView removeFromSuperview];
        [self initWithData:self.currentDictionary withIndex:index withView:SDFF];
    }else{
        self.indexX=index;
        [self.chartView removeFromSuperview];
        [self initWithPastData:self.preDictionary withIndex:index withView:SDFF];
    }
    NSInteger indexxx=23;
    if (self.isFuture) {
        indexxx=0;
    }
    NSString* adfaf=  [NSString stringWithFormat:@"%@",[self.arrayYData objectAtIndex:indexxx]];
    if (adfaf.length>4) {
        adfaf=[adfaf substringWithRange:NSMakeRange(0, 4)];
    }
    if(self.indexX==0){
        [SDFF.indicatorView.tiqiLaleContentUnit setHidden:YES];
    }else if (self.indexX==1){
        adfaf=[NSString stringWithFormat:@"%@级",adfaf];
        [SDFF.indicatorView.tiqiLaleContentUnit setHidden:YES];
    }else{
        [SDFF.indicatorView.tiqiLaleContentUnit setHidden:YES];
    }
    
    SDFF.indicatorView.tiqiLaleContent.text=adfaf;
    
}

-(void)ADAFS{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Private Methods

-(void)initWithPastData:(NSDictionary*)data withIndex:(NSInteger)index withView:(TianqiContentView*)contentView{
    
    contentView.lableWenDuTime.text=@"过去24小时";
    
    self.preDictionary=data;
    
    NSArray* arrray=data[@"previous24h"];
    
    if (arrray.count==0) {
        return;
    }
    
    self.arrayYData=[[NSMutableArray alloc]init];
    self.arrayDate=[[NSMutableArray alloc]init];
    
    
    for (NSDictionary* asdff in arrray) {
        if (index==0) {
            [self.arrayYData addObject:asdff[@"tmp"]];
        }else if (index==1){
            [self.arrayYData addObject:asdff[@"wind_sc"]];
        }else{
            [self.arrayYData addObject:asdff[@"pcpn"]];
        }
        
        [self.arrayDate addObject:[self getDateFromString:asdff[@"time"]]];
    }
    
    
    self.highTemp=[self getcONTT:self.arrayYData isMax:YES];
    self.lowTemp=[self getcONTT:self.arrayYData isMax:NO];
    
    if (index==0) {
        self.highTemp= self.highTemp+ (self.highTemp-self.lowTemp)/2+1;
        self.lowTemp=self.lowTemp- (self.highTemp-self.lowTemp)/2-1;
    }else{
        self.highTemp=[self getcONTT:self.arrayYData isMax:YES]+3.0f;
    }
    
    self.INDEXXX=1;
    self.chartView = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(0, 0, WIDETH*4, GraphViewWenDuHeight+GADAFSFF)
                                                   withSource:self
                                                    withStyle:UUChartStyleLine
                                                    withColor:2
                                              withIndexChoose:index
                      ];
    self.chartView.count=self.arrayYData.count;
    self.chartView.commonDataSource=arrray;
    
    [self.chartView showInView:contentView.mTempScrollView];
    contentView.mTempScrollView .delegate=self;
    contentView.mTempScrollView.tag=10000;
    [contentView.mTempScrollView setContentSize:CGSizeMake(WIDETH*4, GraphViewWenDuHeight+GADAFSFF)];
    [self addWenDu:index];
}


-(void)initWithData:(NSDictionary*)content withIndex:(NSInteger)index withView:(TianqiContentView*)contentView{
    contentView.lableWenDuTime.text=@"未来24小时";
    
    self.currentDictionary=content;
    
    NSArray* arrray= content[@"hourly_forecast"];
    
    if (arrray.count==0) {
        return;
    }
    
    self.arrayYData=[[NSMutableArray alloc]init];
    self.arrayDate=[[NSMutableArray alloc]init];
    
    
    for (NSDictionary* asdff in arrray) {
        if (index==0) {
            [self.arrayYData addObject:asdff[@"tmp"]];
        }else{
            [self.arrayYData addObject:asdff[@"wind_sc_code"]];
        }
        
        [self.arrayDate   addObject:[self getDateFromString:asdff[@"time"]]];
    }
    
    
    self.highTemp=[self getcONTT:self.arrayYData isMax:YES];
    self.lowTemp=[self getcONTT:self.arrayYData isMax:NO];
    
    if (index==0) {
        self.highTemp= self.highTemp+ (self.highTemp-self.lowTemp)/2+1;
        self.lowTemp=self.lowTemp- (self.highTemp-self.lowTemp)/2-1;
    }else{
        self.highTemp=[self getcONTT:self.arrayYData isMax:YES]+3.0f;
    }
    
    
    self.INDEXXX=1;
    self.chartView = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(0, 0, WIDETH*4, GraphViewWenDuHeight+GADAFSFF)
                                                   withSource:self
                                                    withStyle:UUChartStyleLine
                                                    withColor:2
                                              withIndexChoose:index
                      ];
    self.chartView.count=self.arrayYData.count;
    self.chartView.commonDataSource=arrray;
    
    [self.chartView showInView:contentView.mTempScrollView];
    contentView.mTempScrollView .delegate=self;
    contentView.mTempScrollView.tag=10000;
    [contentView.mTempScrollView setContentSize:CGSizeMake(WIDETH*4, GraphViewWenDuHeight+GADAFSFF)];
    [self addWenDu:index];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag!=10000) {
        return;
    }
    NSInteger indexxxx=[self getTitleIndex];
    self.tianQiYubaoView.pageControl.currentPage=indexxxx;
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    TianqiContentView* SDFF= (TianqiContentView*) [self.tianQiYubaoView.mScrollView viewWithTag:indexxxx+1000];
    
    CGFloat heee=6;
    if (IS_IPHONE_5_HEIGHT) {
        heee=108;
    }else if (IS_IPHONE_6P_HEIGHT){
        heee=118;
    }
    CGFloat p = scrollView.contentOffset.x/(scrollView.contentSize.width - scrollView.frame.size.width+(SDFF.indicatorView.frame.size.width-SDFF.indicatorView.frame.size.width*scrollView.frame.size.width/scrollView.contentSize.width));
    if (p>=0.96111) {
        [SDFF.indicatorView setFrame:CGRectMake(p*scrollView.contentSize.width-15, scrollView.frame.origin.y-heee, SDFF.indicatorView.frame.size.width, SDFF.indicatorView.frame.size.height)];
    }else{
        [SDFF.indicatorView setFrame:CGRectMake(p*scrollView.contentSize.width+15, scrollView.frame.origin.y-heee, SDFF.indicatorView.frame.size.width, SDFF.indicatorView.frame.size.height)];
    }
    NSInteger indexxx=  (NSInteger)(24*p);
    if (indexxx>=24) {
        indexxx=23;
    }
    
    if (indexxx<=0) {
        indexxx=0;
    }
    NSString* adfaf=  [NSString stringWithFormat:@"%@",[self.arrayYData objectAtIndex:indexxx]];
    if (adfaf.length>4) {
        adfaf=[adfaf substringWithRange:NSMakeRange(0, 4)];
    }
    if(self.indexX==0){
        [SDFF.indicatorView.tiqiLaleContentUnit setHidden:YES];
    }else if (self.indexX==1){
        adfaf=[NSString stringWithFormat:@"%@级",adfaf];
        [SDFF.indicatorView.tiqiLaleContentUnit setHidden:YES];
    }else{
        [SDFF.indicatorView.tiqiLaleContentUnit setHidden:YES];
    }
    
    SDFF.indicatorView.tiqiLaleContent.text=adfaf;
    
}


-(void)addWenDu:(NSInteger)index{
    
    NSInteger indexxxx=[self getTitleIndex];
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    TianqiContentView* SDFF= (TianqiContentView*) [self.tianQiYubaoView.mScrollView viewWithTag:indexxxx+1000];
    NSInteger max = 0;
    NSInteger min = 1000000000;
    NSArray* aDAf=@[self.arrayYData];
    
    for (NSArray * ary in aDAf) {
        for (NSString *valueString in ary) {
            NSInteger value = [valueString integerValue];
            if (value > max) {
                max = value;
            }
            if (value < min) {
                min = value;
            }
        }
    }
    max = max<5 ? 5:max;
    float  _yValueMin = self.lowTemp;
    float    _yValueMax = self.highTemp;
    
    float level = (_yValueMax-_yValueMin) /2.0;
    if ([SDFF viewWithTag:2000]) {
        
        for (NSInteger i=0; i<=4; i+=2) {
            
            UUChartLabel* lable=  [SDFF viewWithTag:2000+i];
            UILabel* adsf=[SDFF viewWithTag:20000+i];
            if (index==0) {
                [adsf setHidden:YES];
                if (i==0) {
                    lable.text = [NSString stringWithFormat:@"%.1f",_yValueMin];
                }else if (i==2){
                    lable.text = [NSString stringWithFormat:@"%.1f",level+_yValueMin];
                    
                }else{
                    lable.text = [NSString stringWithFormat:@"%.1f",_yValueMax];
                }
            }else if(index==1){
                [adsf setHidden:YES];
                
                if (i==0) {
                    lable.text = [NSString stringWithFormat:@"%@级",[NSNumber numberWithFloat:_yValueMin]];
                }else if (i==2){
                    lable.text = [NSString stringWithFormat:@"%@级",[NSNumber numberWithFloat:level+_yValueMin]];
                    
                }else{
                    lable.text = [NSString stringWithFormat:@"%@级",[NSNumber numberWithFloat:_yValueMax]];
                }
            }else{
                [adsf setHidden:YES];
                
                if (i==0) {
                    lable.text = [NSString stringWithFormat:@"%@mm",[NSNumber numberWithFloat:_yValueMin]];
                }else if (i==2){
                    lable.text = [NSString stringWithFormat:@"%@mm",[NSNumber numberWithFloat:level+_yValueMin]];
                }else{
                    lable.text = [NSString stringWithFormat:@"%@mm",[NSNumber numberWithFloat:_yValueMax]];
                }
            }
        }
        
    }else{
        
        
        CGFloat chartCavanHeight = self.chartView.frame.size.height - UULabelHeight*3-GADAFSFF;
        CGFloat levelHeight = chartCavanHeight /4.0;
        
        CGFloat adafsf=SDFF.mTempScrollView.top;
        
        for (int i=0; i<=4; i+=2) {
            UUChartLabel * label = [[UUChartLabel alloc] initWithFrame:CGRectMake(SDFF.segementWendu.left,chartCavanHeight-i*levelHeight+5+adafsf, UUYLabelwidth, UULabelHeight)];
            label.tag=2000+i;
            label.textColor=[UIColor whiteColor];
            label.font=[UIFont systemFontOfSize:14];
            if (i==0) {
                label.text = [NSString stringWithFormat:@"%.1f",_yValueMin];
            }else if (i==2){
                label.text = [NSString stringWithFormat:@"%.1f",level+i+_yValueMin];
            }else{
                label.text = [NSString stringWithFormat:@"%.1f",_yValueMax];
            }
            
            [SDFF addSubview:label];
            
            UILabel *labelDu = [[UILabel alloc]initWithFrame:CGRectMake(label.centerX+[self getTextLength:label]/2+1,label.top-1,5,7)];
            labelDu.tag=20000+i;
            labelDu.font = [UIFont systemFontOfSize:10];
            labelDu.textAlignment = NSTextAlignmentCenter;
            labelDu.textColor = [UIColor whiteColor];
            labelDu.text = @"o";
            [SDFF addSubview:labelDu];
            
        }
    }
    
    
    
    NSInteger indexxx=23;
    if (self.isFuture) {
        indexxx=0;
    }
    NSString* adfaf=  [NSString stringWithFormat:@"%@",[self.arrayYData objectAtIndex:indexxx]];
    if (adfaf.length>4) {
        adfaf=[adfaf substringWithRange:NSMakeRange(0, 4)];
    }
    if(self.indexX==0){
        [SDFF.indicatorView.tiqiLaleContentUnit setHidden:YES];
    }else if (self.indexX==1){
        adfaf=[NSString stringWithFormat:@"%@级",adfaf];
        [SDFF.indicatorView.tiqiLaleContentUnit setHidden:YES];
    }else{
        [SDFF.indicatorView.tiqiLaleContentUnit setHidden:YES];
    }
    
    SDFF.indicatorView.tiqiLaleContent.text=adfaf;
}


-(float)getTextLength:(UILabel*)adad{
    
    CGSize titleSize = [adad.text sizeWithFont:adad.font constrainedToSize:CGSizeMake(MAXFLOAT, adad.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    return titleSize.width;
}

-(void)getData{
    
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    [self.tianQiYubaoView.mScrollView setContentSize:CGSizeMake(WIDETH*ADSAFAF.count, HEIGHTH-44)];
    self.tianQiYubaoView.pageControl.numberOfPages=ADSAFAF.count;
    self.tianQiYubaoView.pageControl.currentPage=0;
    if ([self.tianQiYubaoView.mScrollView subviews].count>0) {
        [self.tianQiYubaoView.mScrollView removeAllSubviews];
    }
    
    NSInteger indexChoose= [self getTitleIndex];
    self.tianQiYubaoView.pageControl.currentPage=indexChoose;
    self.tianQiYubaoView.mScrollView.contentOffset=CGPointMake(WIDETH*indexChoose, 0);
    for (NSInteger index=0; index<ADSAFAF.count; index++) {
        TianqiContentView* adafsf=[[TianqiContentView alloc]initWithFrame:CGRectMake(index*WIDETH, 0, WIDETH, GraphViewWenDuHeight+GADAFSFF) isFuture:self.isFuture];
        adafsf.tag=index+1000;
        adafsf.segementWendu.delegate=self;
        [self.tianQiYubaoView.mScrollView addSubview:adafsf];
        if(index==indexChoose){
            [self getDataWithInfo:[ADSAFAF objectAtIndex:index]];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self SETsCJDDDDD:scrollView];
    
}

-(void)SETsCJDDDDD:(UIScrollView *)scrollView{
    if (scrollView.tag==10000) {
        return;
    }
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSInteger indeddd=scrollView.contentOffset.x/WIDETH;
    if (self.isFuture) {
        NSDictionary* adsFAFS=[GloableInfo getCacheInfo:[ADSAFAF objectAtIndex:indeddd][@"sNum"]];
        self.tianQiYubaoView.pageControl.currentPage=indeddd;
        [self checkTitle:[ADSAFAF objectAtIndex:indeddd][@"sName"]];
        if (self.chartView) {
            [self.chartView removeFromSuperview];
        }
        if (adsFAFS) {
            TianqiContentView* contentView=[self.tianQiYubaoView.mScrollView viewWithTag:indeddd+1000];
            [self initWithData:adsFAFS withIndex:0 withView:contentView];
            [SVProgressHUD dismiss];
            contentView.segementWendu.selectedIndex=0;
        }else{
            [self getDataWithInfo:[ADSAFAF objectAtIndex:indeddd]];
        }
        

    }else{
        NSDictionary* adsFAFS=[GloableInfo getCacheInfoPast:[ADSAFAF objectAtIndex:indeddd][@"sNum"]];
        self.tianQiYubaoView.pageControl.currentPage=indeddd;
        [self checkTitle:[ADSAFAF objectAtIndex:indeddd][@"sName"]];
        if (self.chartView) {
              [self.chartView removeFromSuperview];
        }
        if (adsFAFS) {
            TianqiContentView* contentView=[self.tianQiYubaoView.mScrollView viewWithTag:indeddd+1000];
            [self initWithPastData:adsFAFS withIndex:0 withView:contentView];
            [SVProgressHUD dismiss];
            contentView.segementWendu.selectedIndex=0;
        }else{
            [self getDataWithInfo:[ADSAFAF objectAtIndex:indeddd]];
        }
        

    }
    
 }

-(void)checkTitle:(NSString*)adsf{
    if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
        self.tianQiYubaoView.locationImageView.image=IMAGE(@"location");
    }else{
        self.tianQiYubaoView.locationImageView.image=nil;
    }
    self.tianQiYubaoView.locationLable.text=adsf;
    [ self.tianQiYubaoView layoutSubviews];
}



-(void)getDataWithInfo:(NSDictionary*)adaDSFASF{
    
    NSMutableDictionary* dictionaryP=[[NSMutableDictionary alloc]init];
    [dictionaryP setObject:adaDSFASF[@"sNum"] forKey:@"stationNum"];
    
    if (self.isFuture) {
        [[HardaHttpClient sharedClient] getDataWithUrl:tianQiUrl withParameters:dictionaryP deledate:self];
    }else{
        [[HardaHttpClient sharedClient] getDataWithUrl:publishCommonUrl withParameters:dictionaryP deledate:self];
    }
}


#pragma mark HardaHttpDelegate
-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url{
    [SVProgressHUD dismiss];
    if ([response allKeys].count==0) {
        return;
    }
    NSInteger indexxxx=[self getTitleIndex];
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    TianqiContentView* SDFF= (TianqiContentView*) [self.tianQiYubaoView.mScrollView viewWithTag:indexxxx+1000];
    
    if ([url isEqual:tianQiUrl]) {
        [GloableInfo setCacheInfo:[ADSAFAF objectAtIndex:indexxxx][@"sNum"] withContent:response];
        [self initWithData:response withIndex:0 withView:SDFF];
    }else{
        [GloableInfo setCacheInfoPast:[ADSAFAF objectAtIndex:indexxxx][@"sNum"] withContent:response];
        
        [self initWithPastData:response withIndex:0 withView:SDFF];
        
        //        [self.tianQiYubaoView.mTempScrollView setContentOffset:CGPointMake(WIDETH*4, GraphViewWenDuHeight+GADAFSFF)];
        
    }
}


-(NSInteger)getTitleIndex{
    NSString* adasfsafs=self.tianQiYubaoView.locationLable.text;
    
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


-(void)didFailLoadWithResponse:(NSDictionary*)response{
    [SVProgressHUD dismissWithError:response[@"MESSAGE"]];
}
-(void)didLoadTimeOut{
    [SVProgressHUD dismissWithError:@"网络请求超时,请稍后再试"];
}


-(NSString*)getDateFromString:(NSString*)adadf{
    NSDateFormatter* ADAFFa=[[NSDateFormatter alloc]init];
    if (adadf.length==10) {
        [ADAFFa setDateFormat:@"yyyyMMddHH"];
    }else{
        [ADAFFa setDateFormat:@"yyyyMMddHHmm"];
    }
    
    NSDate* dada= [ADAFFa dateFromString:adadf];
    [ADAFFa setDateFormat:@"HH:mm"];
    return [ADAFFa stringFromDate:dada];
}

#pragma mark - @required

-(CGFloat)getcONTT:(NSArray*)array isMax:(BOOL)isMax{
    CGFloat adafsaf=[[array objectAtIndex:0] floatValue];
    for (NSInteger i=1; i<array.count; i++) {
        CGFloat ADAff=  [[array objectAtIndex:i] floatValue];
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
        NSString * str = [self.arrayDate objectAtIndex:i];
        [xTitles addObject:str];
    }
    return xTitles;
}

//横坐标标题数组
- (NSArray *)chartConfigAxisXLabel:(UUChart *)chart
{
    return [self getXTitles:self.arrayYData.count];
}
//数值多重数组
- (NSArray *)chartConfigAxisYValue:(UUChart *)chart
{
    if (self.INDEXXX==1) {
        return @[self.arrayYData];
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
    return CGRangeMake(self.highTemp, self.lowTemp);
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

