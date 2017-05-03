//
//  YujingViewController.m
//  TangShan
//
//  Created by Tony on 12/22/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "YujingViewController.h"
#import "ListDataSource.h"
#import "YujingTableViewCell.h"
#import "YujingDetailsViewController.h"


static NSString* const YujingViewControllerIdentifer=@"YujingViewControllerIdentifer";

@interface YujingViewController ()<UITableViewDelegate,PullTableViewDelegate>

@property(strong,nonatomic)ListDataSource* mDataSource;

@property(strong,nonatomic)NSMutableArray* arrayContent;

@property(strong,nonatomic)NSMutableArray* arrayContentData;

@end

@implementation YujingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayContent=[[NSMutableArray alloc]init];
    self.arrayContentData=[[NSMutableArray alloc]init];
    [self.arrayContent addObject:@"54534"];
    [self.arrayContent addObject:@"54533"];
    [self.arrayContent addObject:@"54532"];
    [self.arrayContent addObject:@"54531"];
    [self.arrayContent addObject:@"54437"];
    [self.arrayContent addObject:@"54539"];
    [self.arrayContent addObject:@"54434"];
    [self.arrayContent addObject:@"54522"];
    [self.arrayContent addObject:@"54535"];
    [self.arrayContent addObject:@"54429"];
    [self.arrayContent addObject:@"54439"];
    [self.arrayContent addObject:@"54538"];
    [self.arrayContent addObject:@"50000"];
    
    self.yujingView=[[YujingView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.yujingView];
    
    self.yujingView.locationLable.text=self.sName;
    [self setUpTableView];
    [self.yujingView.locationButton addTarget:self action:@selector(adasfa) forControlEvents:UIControlEventTouchUpInside];
    [self getData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString* adsf= self.yujingView.locationLable.text;
    if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
        self.yujingView.locationImageView.image=IMAGE(@"location");
    }else{
        self.yujingView.locationImageView.image=nil;
    }
}

-(void)getData{
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableDictionary* dictionary=[[NSMutableDictionary alloc]init];
    for (NSInteger i=0; i<self.arrayContent.count; i++) {
        [dictionary setObject:[self.arrayContent objectAtIndex:i] forKey:@"stationNum"];
        [[HardaHttpClient sharedClient] getDataWithUrl:publishServiceUrl withParameters:dictionary deledate:self];
    }
}

#pragma mark HardaHttpDelegate
-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url{
    [SVProgressHUD dismiss];
    [self.arrayContentData addObjectsFromArray:response[@"alarm"]];
    self.mDataSource.items=self.arrayContentData;
    if (self.mDataSource.items.count<=0) {
        [self.yujingView.noData setHidden:NO];
    }else{
        [self.yujingView.noData setHidden:YES];
    }
    [self.yujingView.mTableView reloadData];
}
-(void)didFailLoadWithResponse:(NSDictionary*)response{
    [SVProgressHUD dismissWithError:response[@"MESSAGE"]];
}
-(void)didLoadTimeOut{
    [SVProgressHUD dismissWithError:@"网络请求超时,请稍后再试"];
}

-(void)adasfa{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YujingDetailsViewController* asfaf=[[YujingDetailsViewController alloc]initWithNibName:nil bundle:nil];
    asfaf.mDictionary=[self.mDataSource.items objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:asfaf animated:YES];
    
}


#pragma mark PullTableViewDelegate
- (void)pullTableViewDidTriggerRefresh:(PullTableView*)pullTableView{
    pullTableView.pullTableIsLoadingMore=NO;
    pullTableView.pullTableIsRefreshing=NO;
    
}
- (void)pullTableViewDidTriggerLoadMore:(PullTableView*)pullTableView{
    pullTableView.pullTableIsLoadingMore=NO;
    pullTableView.pullTableIsRefreshing=NO;
    
}


-(NSString*)getDateFromString:(NSString*)adadf{
    NSDateFormatter* ADAFFa=[[NSDateFormatter alloc]init];
    if (adadf.length==10) {
        [ADAFFa setDateFormat:@"yyyyMMddHH"];
    }else{
        [ADAFFa setDateFormat:@"yyyyMMddHHmmss"];
    }
    
    NSDate* dada= [ADAFFa dateFromString:adadf];
    [ADAFFa setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [ADAFFa stringFromDate:dada];
}

#pragma mark Private Methods
-(void)setUpTableView{
    self.mDataSource=[[ListDataSource alloc]initWithItems:[NSArray array] cellIdentifier:YujingViewControllerIdentifer configureCellBlock:^(YujingTableViewCell* cell, id item) {
        cell.yujingTitleLable.text=[NSString stringWithFormat:@"%@%@%@%@预警",item[@"releaser"],item[@"state"],item[@"type"],item[@"level"]];
        cell.yujingTimeLable.text=[self getDateFromString:item[@"date"]];
        cell.yujingImageView.image=[self getImage:item[@"type"] withContent:item[@"level"]];
    }];
    
    self.yujingView.mTableView.dataSource=self.mDataSource;
    self.yujingView.mTableView.delegate=self;
    self.yujingView.mTableView.pullDelegate=self;
    self.yujingView.mTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [self.yujingView.mTableView registerClass:[YujingTableViewCell class] forCellReuseIdentifier:YujingViewControllerIdentifer];
}


-(UIImage*)getImage:(NSString*)daolu withContent:(NSString*)huangse{
    NSString* dsafsf;
    if ([daolu containsString:@"台风"]) {
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"taifenglans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"taifenghuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"taifengchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"taifenghongs";
        }
    }else if ([daolu containsString:@"暴雨"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"baoyulans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"baoyuhuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"baoyuchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"baoyuhongs";
        }
    }else if ([daolu containsString:@"暴雪"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"baoxuelans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"baoxuehuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"baoxuechengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"baoxuehongs";
        }
    }else if ([daolu containsString:@"寒潮"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"hanchaolans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"hanchaohuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"hanchaochengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"hanchaohongs";
        }
    }else if ([daolu containsString:@"大风"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"dafenglans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"dafenghuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"dafengchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"dafenghongs";
        }
    }else if ([daolu containsString:@"沙尘暴"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"shalans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"shahuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"shachengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"shahongs";
        }
    }else if ([daolu containsString:@"高温"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"gaolans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"gaohuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"gaochengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"gaohongs";
        }
    }else if ([daolu containsString:@"干旱"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"ganlans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"ganhuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"ganchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"ganhongs";
        }
    }else if ([daolu containsString:@"雷电"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"leilans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"leihuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"leichengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"leihongs";
        }
    }else if ([daolu containsString:@"冰雹"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"binglans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"binghuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"bingchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"binghongs";
        }
    }else if ([daolu containsString:@"霜冻"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"shuanglans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"shuanghuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"shuangchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"shuanghongs";
        }
    }else if ([daolu containsString:@"大雾"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"wulans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"wuhuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"wuchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"wuhongs";
        }
    }else if ([daolu containsString:@"霾"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"mailans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"maihuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"maichengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"maihongs";
        }
    }else if ([daolu containsString:@"道路结冰"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"llans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"lhuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"lchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"lhongs";
        }
    }
    return IMAGE(dsafsf);
}

@end
