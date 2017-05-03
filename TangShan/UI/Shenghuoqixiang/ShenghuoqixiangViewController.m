//
//  ShenghuoqixiangViewController.m
//  TangShan
//
//  Created by Tony on 1/6/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "ShenghuoqixiangViewController.h"
#import "ShenghuoQTableViewCell.h"
#import "ListDataSource.h"

static NSString* const NongyeViewControllerIdentifer=@"NongyeViewControllerIdentiferdadf";

@interface ShenghuoqixiangViewController ()<UITableViewDelegate,HardaHttpClientDelegate>

@property(strong,nonatomic)ListDataSource* mDataSource;

@end

@implementation ShenghuoqixiangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shenghuoQiView=[[ShenghuoqixiangView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.shenghuoQiView];
    [self initTableView];
    self.shenghuoQiView.locationLable.text=@"唐山";
    self.shenghuoQiView.locationImageView.image=nil;
    [self.shenghuoQiView.locationButton addTarget:self action:@selector(assfsg) forControlEvents:UIControlEventTouchUpInside];
    
    [self getData];
}


-(void)assfsg{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    NSString* adsf=self.shenghuoQiView.locationLable.text;
//    if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
//        self.shenghuoQiView.locationImageView.image=IMAGE(@"location");
//    }else{
//        self.shenghuoQiView.locationImageView.image=nil;
//    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

#pragma mark HardaHttpDelegate
-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url{
    [SVProgressHUD dismiss];
    self.mDataSource.items=response[@"index"];
    [self.shenghuoQiView.mTableView reloadData];
}
-(void)didFailLoadWithResponse:(NSDictionary*)response{
    [SVProgressHUD dismissWithError:response[@"MESSAGE"]];
}
-(void)didLoadTimeOut{
    [SVProgressHUD dismissWithError:@"网络请求超时,请稍后再试"];
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(void)getData{
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableDictionary* dictionary=[[NSMutableDictionary alloc]init];
    [dictionary setObject:@"54534" forKey:@"stationNum"];
    [[HardaHttpClient sharedClient] getDataWithUrl:regesterUrl withParameters:dictionary deledate:self];
}


-(void)initTableView{
    
    self.mDataSource=[[ListDataSource alloc]initWithItems:[NSArray array] cellIdentifier:NongyeViewControllerIdentifer configureCellBlock:^(ShenghuoQTableViewCell* cell, id item) {
        NSString* ADAF=item[@"indexName"];
        if ([ADAF containsString:@"晨练"]) {
            cell.imageViewConten.image=IMAGE(@"chenlian");
        }else if ([ADAF containsString:@"冠心"]){
            cell.imageViewConten.image=IMAGE(@"guanxin");
            
        }else if ([ADAF containsString:@"火险"]){
            cell.imageViewConten.image=IMAGE(@"huoxian");
            
        }else if ([ADAF containsString:@"晾晒"]){
            cell.imageViewConten.image=IMAGE(@"liangshai");
            
        }else if ([ADAF containsString:@"旅游"]){
            cell.imageViewConten.image=IMAGE(@"lvyou");
            
        }else if ([ADAF containsString:@"洗车"]){
            cell.imageViewConten.image=IMAGE(@"xiche");
            
        }else if ([ADAF containsString:@"低"]){
            cell.imageViewConten.image=IMAGE(@"zuidi");
            
        }else if ([ADAF containsString:@"高"]){
            cell.imageViewConten.image=IMAGE(@"zuigao");
            
        }else if ([ADAF containsString:@"穿衣"]){
            cell.imageViewConten.image=IMAGE(@"chuanyi");
            
        }else if ([ADAF containsString:@"紫外"]){
            cell.imageViewConten.image=IMAGE(@"ziwai");
            
        }else if ([ADAF containsString:@"舒适"]){
            cell.imageViewConten.image=IMAGE(@"shushi");
            
        }else if ([ADAF containsString:@"蓝天"]){
            cell.imageViewConten.image=IMAGE(@"lantian");
            
        }else if ([ADAF containsString:@"闷热"]){
            cell.imageViewConten.image=IMAGE(@"menre");
            
        }
        
        cell.mLable.text=[NSString stringWithFormat:@"%@:%@",ADAF,item[@"brf"]];
        cell.mLableContent.text=item[@"txt"];
    }];
    self.shenghuoQiView.mTableView.delegate=self;
    self.shenghuoQiView.mTableView.dataSource=self.mDataSource;
    [self.shenghuoQiView.mTableView registerClass:[ShenghuoQTableViewCell class] forCellReuseIdentifier:NongyeViewControllerIdentifer];
}

@end
