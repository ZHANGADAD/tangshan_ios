//
//  ShenghuoViewController.m
//  TangShan
//
//  Created by Tony on 12/22/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "ShenghuoViewController.h"
#import "ListDataSource.h"
#import "ShenghuoTableViewCell.h"


static NSString* const ShenghuoViewControllerIdentifer=@"ShenghuoViewControllerIdentifer";

@interface ShenghuoViewController ()<UITableViewDelegate,PullTableViewDelegate>

@property(strong,nonatomic)ListDataSource* mDataSource;

@end

@implementation ShenghuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shengHuoView=[[YujingView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.shengHuoView];
    [self setUpTableView];
    
}
#pragma mark Private Methods
-(void)setUpTableView{
    
    self.mDataSource=[[ListDataSource alloc]initWithItems:[NSArray array] cellIdentifier:ShenghuoViewControllerIdentifer configureCellBlock:^(ShenghuoTableViewCell* cell, id item) {
//        cell.shengImageView.image=IMAGE(item[@"imageLogo"]);
//        cell.shengTitleLable.text=item[@"title"];
//        cell.shengContentLable.text=item[@"content"];
        
        cell.shengImageView.image=IMAGE(@"home");
        cell.shengTitleLable.text=@"路况制服";
        cell.shengContentLable.text=@"替你是否是否是否过高时";
        
    }];
    self.shengHuoView.mTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.shengHuoView.mTableView.dataSource=self.mDataSource;
    self.shengHuoView.mTableView.delegate=self;
    self.shengHuoView.mTableView.pullDelegate=self;
  
    [self.shengHuoView.mTableView registerClass:[ShenghuoTableViewCell class] forCellReuseIdentifier:ShenghuoViewControllerIdentifer];
    
    self.mDataSource.items=[NSArray arrayWithObjects:@"111",@"11",@"222", nil];
    [self.shengHuoView.mTableView reloadData];
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
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

@end
