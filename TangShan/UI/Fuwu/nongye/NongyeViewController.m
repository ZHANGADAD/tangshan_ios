//
//  NongyeViewController.m
//  TangShan
//
//  Created by Tony on 12/21/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "NongyeViewController.h"
#import "ListDataSource.h"
#import "NongyeTableViewCell.h"
#import "NongyeDetailsViewController.h"


static NSString* const NongyeViewControllerIdentifer=@"NongyeViewControllerIdentifer";

@interface NongyeViewController ()<UITableViewDelegate,PullTableViewDelegate,NongyeViewDelegate>
@property(strong,nonatomic)ListDataSource* mDataSource;
@end

@implementation NongyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nongyeView=[[NongyeView alloc]initWithFrame:self.view.frame];
    self.nongyeView.delegate=self;
    [self.view addSubview:self.nongyeView];
    
    self.nongyeView.locationLable.text=[GloableInfo getDefaultCityInfo][@"sName"];
    
    [self initTableView];
    
}


-(void)didLocationSelect{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Private Methods

-(void)initTableView{
    
    self.mDataSource=[[ListDataSource alloc]initWithItems:[NSArray array] cellIdentifier:NongyeViewControllerIdentifer configureCellBlock:^(NongyeTableViewCell* cell, id item) {
//        cell.nongyeTitleLable.text=item[@"title"];
//        cell.nongyeTimeLable.text=item[@"time"];
//        cell.nongyeContentLable.text=item[@"content"];
        
                cell.nongyeTitleLable.text=@"我的作业";
                cell.nongyeTimeLable.text=@"2015-1-2";
                cell.nongyeContentLable.text=@"我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业我的作业";
        
    }];
    self.nongyeView.mTableView.pullDelegate=self;
    self.nongyeView.mTableView.delegate=self;
    self.nongyeView.mTableView.dataSource=self.mDataSource;
    [self.nongyeView.mTableView registerClass:[NongyeTableViewCell class] forCellReuseIdentifier:NongyeViewControllerIdentifer];
    
    self.mDataSource.items=[NSArray arrayWithObjects:@"111",@"11",@"222", nil];
    [self.nongyeView.mTableView reloadData];
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

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  300;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NongyeDetailsViewController* detailsController=  [[NongyeDetailsViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:detailsController animated:YES];
}
@end
