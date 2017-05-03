//
//  KongqiViewController.m
//  TangShan
//
//  Created by chemi ios on 2/27/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "KongqiViewController.h"
#import "KongqiView.h"
#import "UUChart.h"
#import "UUChartLabel.h"
#import "TianqiContentView.h"


@interface KongqiViewController ()<UUChartDataSource,UIScrollViewDelegate>

@property(strong,nonatomic)KongqiView* kongqiView;
@property(strong,nonatomic)UUChart* chartViewY;

@property(assign,nonatomic)  float lowFeng;
@property(assign,nonatomic)  float higeFeng;

@property(strong,nonatomic)NSMutableArray* arrayYData;

@property(strong,nonatomic)NSMutableArray* arrayDate;

@end

@implementation KongqiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.kongqiView=[[KongqiView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.kongqiView];
    self.kongqiView.locationLable.text=self.sName;
    [self.kongqiView.locationButton addTarget:self action:@selector(ADAFS) forControlEvents:UIControlEventTouchUpInside];
    
    self.kongqiView.mTempScrollView.delegate=self;
    
    [self checkTitle:self.kongqiView.locationLable.text];
    [self getData];
}

-(void)getData{
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableDictionary* dictionaryp=[[NSMutableDictionary alloc]init];
    [dictionaryp setObject:self.sNum forKey:@"stationNum"];
    [[HardaHttpClient sharedClient] getDataWithUrl:servieListUrl withParameters:dictionaryp deledate:self];
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


-(void)checkTitle:(NSString*)adsf{
    if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
        self.kongqiView.locationImageView.image=IMAGE(@"location");
    }else{
        self.kongqiView.locationImageView.image=nil;
    }
    self.kongqiView.locationLable.text=adsf;
}
#pragma mark HardaHttpDelegate
-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url{
    [SVProgressHUD dismiss];
    
    NSArray* arrray=(NSArray*)response;
    
    if (arrray.count==0) {
        return;
    }
    
    self.arrayYData=[[NSMutableArray alloc]init];
    self.arrayDate=[[NSMutableArray alloc]init];
    
    
    for (NSDictionary* asdff in arrray) {
        
        [self.arrayYData addObject:asdff[@"AQI_value"]];
        
        [self.arrayDate   addObject:[self getDateFromString:asdff[@"datatime"]]];
    }
    
    
    self.higeFeng=[self getcONTT:self.arrayYData isMax:YES];
    self.lowFeng=[self getcONTT:self.arrayYData isMax:NO];
    
    self.higeFeng= self.higeFeng+ (self.higeFeng-self.lowFeng)/2+1;

    
    self.chartViewY = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(0, 0, WIDETH*4,GraphViewWenDuHeight+GADAFSFF)
                                                    withSource:self
                                                     withStyle:UUChartStyleLine
                                                     withColor:2
                                               withIndexChoose:0];
    self.chartViewY.count=self.arrayDate.count;
    self.chartViewY.commonDataSource=arrray;
    
    
    [self.chartViewY showInView:self.kongqiView.mTempScrollView];
    self.kongqiView.mTempScrollView.delegate=self;
    [self.kongqiView.mTempScrollView setContentSize:CGSizeMake(WIDETH*4, GraphViewWenDuHeight+GADAFSFF)];
    
    [self addaaf:0];
    
    self.kongqiView.indicatorView.tiqiLaleContent.text=[NSString stringWithFormat:@"%@",[self.arrayYData objectAtIndex:0]];
    [self.kongqiView.mTempScrollView setContentOffset:CGPointMake(WIDETH*4, 0)];
}

-(void)addaaf:(NSInteger)index{
    
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
    float  _yValueMin = self.lowFeng;
    float    _yValueMax = self.higeFeng;
    
    float level = (_yValueMax-_yValueMin) /2.0;
    if ([self.kongqiView viewWithTag:1000]) {
        
        for (NSInteger i=0; i<=4; i+=2) {
            
            UUChartLabel* lable=  [self.kongqiView viewWithTag:1000+i];
            UILabel* adsf=[self.kongqiView viewWithTag:10000+i];
            if (index==0) {
                [adsf setHidden:YES];
                if (i==0) {
                    lable.text = [NSString stringWithFormat:@"%.1f",_yValueMin];
                }else if (i==2){
                    lable.text = [NSString stringWithFormat:@"%.1f",level+i+_yValueMin];
                    
                }else{
                    lable.text = [NSString stringWithFormat:@"%.1f",_yValueMax];
                }
            }else if(index==1){
                [adsf setHidden:YES];
                
                if (i==0) {
                    lable.text = [NSString stringWithFormat:@"%@级",[NSNumber numberWithFloat:_yValueMin]];
                }else if (i==2){
                    lable.text = [NSString stringWithFormat:@"%@级",[NSNumber numberWithFloat:level+i+_yValueMin]];
                    
                }else{
                    lable.text = [NSString stringWithFormat:@"%@级",[NSNumber numberWithFloat:_yValueMax]];
                }
            }else{
                [adsf setHidden:YES];
                
                if (i==0) {
                    lable.text = [NSString stringWithFormat:@"%@mm",[NSNumber numberWithFloat:_yValueMin]];
                }else if (i==2){
                    lable.text = [NSString stringWithFormat:@"%@mm",[NSNumber numberWithFloat:level+i+_yValueMin]];
                }else{
                    lable.text = [NSString stringWithFormat:@"%@mm",[NSNumber numberWithFloat:_yValueMax]];
                }
            }
        }
        
    }else{
        
        
        CGFloat chartCavanHeight = self.chartViewY.frame.size.height - UULabelHeight*3-GADAFSFF;
        CGFloat levelHeight = chartCavanHeight /4.0;
        
        CGFloat adafsf=self.kongqiView.mTempScrollView.top;
        
        for (int i=0; i<=4; i+=2) {
            UUChartLabel * label = [[UUChartLabel alloc] initWithFrame:CGRectMake(0.0,chartCavanHeight-i*levelHeight+5+adafsf, UUYLabelwidth, UULabelHeight)];
            label.tag=1000+i;
            label.textColor=[UIColor whiteColor];
            label.font=[UIFont systemFontOfSize:14];
            if (i==0) {
                label.text = [NSString stringWithFormat:@"%.1f",_yValueMin];
            }else if (i==2){
                label.text = [NSString stringWithFormat:@"%.1f",level+i+_yValueMin];
            }else{
                label.text = [NSString stringWithFormat:@"%.1f",_yValueMax];
            }
            
            [self.kongqiView addSubview:label];
        }
    }
    
}

-(void)didFailLoadWithResponse:(NSDictionary*)response{
    [SVProgressHUD dismissWithError:response[@"MESSAGE"]];
}
-(void)didLoadTimeOut{
    [SVProgressHUD dismissWithError:@"网络请求超时,请稍后再试"];
}


-(float)getTextLength:(UILabel*)adad{
    
    CGSize titleSize = [adad.text sizeWithFont:adad.font constrainedToSize:CGSizeMake(MAXFLOAT, adad.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    return titleSize.width;
}



-(void)ADAFS{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat heee=68;
    
    if (IS_IPHONE_5_HEIGHT) {
        heee=108;
    }else if (IS_IPHONE_6P_HEIGHT){
        heee=118;
    }
    CGFloat p = scrollView.contentOffset.x/(scrollView.contentSize.width - scrollView.frame.size.width+(self.kongqiView.indicatorView.frame.size.width-self.kongqiView.indicatorView.frame.size.width*scrollView.frame.size.width/scrollView.contentSize.width));
    if (p>=0.96111) {
        [self.kongqiView.indicatorView setFrame:CGRectMake(p*scrollView.contentSize.width-15, scrollView.frame.origin.y-heee, self.kongqiView.indicatorView.frame.size.width, self.kongqiView.indicatorView.frame.size.height)];
    }else{
        [self.kongqiView.indicatorView setFrame:CGRectMake(p*scrollView.contentSize.width+15, scrollView.frame.origin.y-heee, self.kongqiView.indicatorView.frame.size.width, self.kongqiView.indicatorView.frame.size.height)];
    }
    NSInteger indexxx=  (NSInteger)(23*p);
    if (indexxx>=23) {
        indexxx=22;
    }
    
    if (indexxx<=0) {
        indexxx=0;
    }
    NSString* adfaf=  [NSString stringWithFormat:@"%@",[self.arrayYData objectAtIndex:indexxx]];
    if (adfaf.length>4) {
        adfaf=[adfaf substringWithRange:NSMakeRange(0, 4)];
    }
    self.kongqiView.indicatorView.tiqiLaleContent.text=adfaf;
    
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
    return @[self.arrayYData];
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
    return CGRangeMake(self.higeFeng, self.lowFeng);
    
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


