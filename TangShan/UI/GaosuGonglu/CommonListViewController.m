//
//  CommonListViewController.m
//  TangShan
//
//  Created by Tony on 1/27/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CommonListViewController.h"

static NSString* const ShenghuoViewControllerIdDDDDentifer=@"ShenghuoViewControllerIdentifer";
#import "ListDataSource.h"
#import "CommonlistTableViewCell.h"

@interface CommonListViewController ()<UITableViewDelegate>

@property(strong,nonatomic)ListDataSource* mDataSource;

@end

@implementation CommonListViewController

@synthesize indexTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mCommonView=[[CommonListView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.mCommonView];
    
    [self setUpTableView];
    
    [self getData];
    
}


#pragma mark Private Methods
-(void)setUpTableView{
    
    self.mDataSource=[[ListDataSource alloc]initWithItems:[NSArray array] cellIdentifier:ShenghuoViewControllerIdDDDDentifer configureCellBlock:^(CommonlistTableViewCell* cell, id item) {
        //        cell.shengImageView.image=IMAGE(item[@"imageLogo"]);
        //        cell.shengTitleLable.text=item[@"title"];
        //        cell.shengContentLable.text=item[@"content"];
        
        
    }];
    self.mCommonView.mTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.mCommonView.mTableView.dataSource=self.mDataSource;
    self.mCommonView.mTableView.delegate=self;
    
    [self.mCommonView.mTableView registerClass:[CommonlistTableViewCell class] forCellReuseIdentifier:ShenghuoViewControllerIdDDDDentifer];
    
    self.mDataSource.items=[NSArray arrayWithObjects:@"111",@"11",@"222", nil];
    [self.mCommonView.mTableView reloadData];
}

-(void)getData{
    NSString* url=delPublishUrl;
    if (self.indexTable==1) {
        url=protocalUrl;
    }
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableDictionary* dictionary=[[NSMutableDictionary alloc]init];
    [[HardaHttpClient sharedClient] getDataWithUrl:url withParameters:dictionary deledate:self];
    
}
-(void)initWithData:(NSDictionary*)contentData{
    
    
}

-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url{
    [SVProgressHUD dismiss];
    if ([response allKeys].count==0) {
        return;
    }
    [self initWithData:response];
}
-(void)didFailLoadWithResponse:(NSDictionary*)response{
    [SVProgressHUD dismissWithError:response[@"MESSAGE"]];
}
-(void)didLoadTimeOut{
    [SVProgressHUD dismissWithError:@"网络请求超时,请稍后再试"];
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


@end
