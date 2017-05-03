//
//  FuwuViewController.m
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "FuwuViewController.h"
#import "NongyeViewController.h"
#import "YujingViewController.h"
#import "FiveDaysViewController.h"
#import "ShenghuoqixiangViewController.h"
#import "GaosuGongluViewController.h"
#import "CommonViewController.h"
#import "TianqiYubaoViewController.h"



#import "CitySettingsViewController.h"


@interface FuwuViewController ()<FuwuViewDelegate>
@property(strong,nonatomic)NSString* sNum;
@property(strong,nonatomic)NSString* sName;
@end

@implementation FuwuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fuwuView=[[FuwuView alloc]initWithFrame:self.view.frame];
    self.fuwuView.delegate=self;
    [self.view addSubview:self.fuwuView];
    NSString* adaf=[GloableInfo getDefaultCityInfo][@"sName"];
    if (adaf.length==0) {
        adaf=[GloableInfo getLocationCityInfo][@"sName"];
    }
    [self.fuwuView.locationImageView setHidden:YES];
    self.fuwuView.locationLable.text=adaf;
    [self.fuwuView.locationLable setHidden:YES];
    //    self.fuwuView.locationImageView.image=IMAGE(@"homdadee");
}

-(NSInteger)getTitleIndex{
    NSString* adasfsafs=self.fuwuView.locationLable.text;
    
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


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self checkNeedReloadData];
//    NSString* adsf= self.fuwuView.locationLable.text;
//    if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
//        self.fuwuView.locationImageView.image=IMAGE(@"location");
//    }else{
//        self.fuwuView.locationImageView.image=nil;
//    }
    NSMutableArray* ADSAFAF=[[NSMutableArray alloc]init];
    [ADSAFAF addObject:[GloableInfo getLocationCityInfo]];
    [ADSAFAF addObjectsFromArray:[GloableInfo getChooseCityInfo]];
    NSInteger indexTab= [self getTitleIndex];
    self.sName=[ADSAFAF objectAtIndex:indexTab][@"sName"];
    self.sNum=[ADSAFAF objectAtIndex:indexTab][@"sNum"];
}

-(void)checkNeedReloadData{
    NSString* afaf=[[GloableInfo getDefaultCityInfo] objectForKey:@"sName"];
    NSString* adaf= self.fuwuView.locationLable.text;
    if (![afaf isEqual:adaf]) {
        self.fuwuView.locationLable.text=afaf;
    }
}
#pragma mark FuwuViewDelegate
-(void)didViewSeleted:(NSInteger)indexTab{
    
    switch (indexTab) {
        case 0:
        {   //趋势预报(5日天气预报)
            FiveDaysViewController * daf=[[FiveDaysViewController alloc]initWithNibName:nil bundle:nil];
            daf.sName=self.sName;
            daf.sNum=self.sNum;
            [self.navigationController pushViewController:daf animated:YES];
        }
            
            break;
        case 1:
            //逐小时预报(未来24)
        {
            TianqiYubaoViewController* adaf=[[TianqiYubaoViewController alloc]initWithNibName:nil bundle:nil];
            adaf.sName=self.sName;
            adaf.sNum=self.sNum;
            adaf.isFuture=YES;

            [self.navigationController pushViewController:adaf animated:YES];
        }
            break;
        case 2:
            // 天气实况(过去24小时)
        {
            TianqiYubaoViewController* adaf=[[TianqiYubaoViewController alloc]initWithNibName:nil bundle:nil];
            adaf.sName=self.sName;
            adaf.sNum=self.sNum;
            adaf.isFuture=NO;
            
            [self.navigationController pushViewController:adaf animated:YES];
            
        }
            
            break;
        case 3:
            // 气象预警
        {
            YujingViewController * controller=[[YujingViewController alloc]initWithNibName:nil bundle:nil];
            controller.sName= @"唐山";
            controller.sNum=@"54534";
            [self.navigationController pushViewController:controller animated:YES];
        }
            
            break;
        case 4:
            // 生活气象
            
        {
            ShenghuoqixiangViewController* afdaf=[[ShenghuoqixiangViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController: afdaf animated:YES];
            
        }
            
            break;
        case 5:
            //交通
        {
            
            GaosuGongluViewController * adA=[[GaosuGongluViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:adA animated:YES];
        }
            break;
        
        case 6:
            //旅游气象
        {
            CommonViewController* controller=[[CommonViewController alloc]initWithNibName:nil bundle:nil];
            controller.url=@"http://wx.hbweather.com.cn/jy_module/tsapp/lyqx.php";
            [self.navigationController pushViewController:controller animated:YES];

        }
            break;
            
        case 7:
            //气象科普
        {
            CommonViewController* controller=[[CommonViewController alloc]initWithNibName:nil bundle:nil];
            controller.url=@"http://wx.hbweather.com.cn/index.php?g=Wap&m=Index&a=index&token=mqkxpl1436865077&diymenu=1";
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;

            
        default:
            break;
    }
    
}

@end
