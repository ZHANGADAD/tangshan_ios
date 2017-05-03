//
//  LLLLViewController.m
//  TangShan
//
//  Created by Tony on 1/31/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "LLLLViewController.h"
#import "ListDataSource.h"
#import "LLLTableViewCell.h"

static NSString* const LLLLViewControllerIdentifer=@"LLLLViewControllerIdentifer";


@interface LLLLViewController ()<UITableViewDelegate,HardaHttpClientDelegate>

@property(strong,nonatomic)ListDataSource* mDataSource;

@end

@implementation LLLLViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.llView=[[LLView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.llView];
    
    self.llView.locationLable.text=[GloableInfo getDefaultCityInfo][@"sName"];
    
    [self.llView.locationButton addTarget:self action:@selector(DAffsf) forControlEvents:UIControlEventTouchUpInside];
    
    [self setUpTableView];
    
    [self getData];
}

-(void)DAffsf{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString* adsf=self.llView.locationLable.text;
    if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
        self.llView.locationImageView.image=IMAGE(@"location");
    }else{
        self.llView.locationImageView.image=nil;
    }
    [self checkNeedReloadData];
    
}
-(void)checkNeedReloadData{
    NSString* afaf=[[GloableInfo getDefaultCityInfo] objectForKey:@"sName"];
    NSString* adaf= self.llView.locationLable.text;
    if (![afaf isEqual:adaf]) {
        self.llView.locationLable.text=afaf;
    }
}

-(void)getData{
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableDictionary* dictionary=[[NSMutableDictionary alloc]init];
    
    if (self.indexTable==0) {
        [[HardaHttpClient sharedClient] getDataWithUrl:delPublishUrl withParameters:dictionary deledate:self];
    }else{
        [[HardaHttpClient sharedClient] getDataWithUrl:protocalUrl withParameters:dictionary deledate:self];
    }
    
}

#pragma mark HardaHttpDelegate
-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url{
    [SVProgressHUD dismiss];
    
    self.mDataSource.items=(NSArray*)response;
    
    [self.llView.mTableView reloadData];
    
    
}
-(void)didFailLoadWithResponse:(NSDictionary*)response{
    [SVProgressHUD dismissWithError:response[@"MESSAGE"]];
}
-(void)didLoadTimeOut{
    [SVProgressHUD dismissWithError:@"网络请求超时,请稍后再试"];
}


#pragma mark Private Methods
-(void)setUpTableView{
    
    self.mDataSource=[[ListDataSource alloc]initWithItems:[NSArray array] cellIdentifier:LLLLViewControllerIdentifer configureCellBlock:^(LLLTableViewCell* cell, id item) {
   
        cell.ADASF.text=item[@"area"];
        cell.ADASF1.text=item[@"datatime"];
        cell.ADASF2.text=item[@"info"];
        
    }];
    self.llView.mTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.llView.mTableView.dataSource=self.mDataSource;
    self.llView.mTableView.delegate=self;

    [self.llView.mTableView registerClass:[LLLTableViewCell class] forCellReuseIdentifier:LLLLViewControllerIdentifer];
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
