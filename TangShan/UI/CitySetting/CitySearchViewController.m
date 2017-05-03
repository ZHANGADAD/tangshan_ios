//
//  CitySearchViewController.m
//  TangShan
//
//  Created by Tony on 1/7/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CitySearchViewController.h"
#import "RDVTabBarController.h"
#import "CitySettingsViewController.h"
#import "CitySeachTableViewCell.h"

#import "ListDataSource.h"

static NSString* const CitySearchViewControllerIdentifer=@"CitySearchViewControllerIdentifer";

@interface CitySearchViewController ()<UITableViewDelegate>

@property(strong,nonatomic)ListDataSource* mDataSource;

@property(strong,nonatomic)NSMutableArray* arrayConytent;

@end

@implementation CitySearchViewController
@synthesize arrayConytent;
@synthesize type;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.citySearchView=[[CitySearchView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.citySearchView];
    [self.citySearchView.button addTarget:self action:@selector(dadafs) forControlEvents:UIControlEventTouchUpInside];
    
    [self sadaf];
}

-(void)dadafs{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)textFieldDidChange:(UITextField*)AFASfa{
    [self filterData:AFASfa.text];
}

-(void)sadaf{
    self.arrayConytent=nil;
    if (self.type==0) {
        self.arrayConytent=  [GloableInfo getCityData];
    }else{
        //高速
        self.arrayConytent=  [GloableInfo getCityData];
    }
    
    
    [self.citySearchView.searchBAR addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.citySearchView.searchBAR becomeFirstResponder];
    
    
    self.mDataSource=[[ListDataSource alloc]initWithItems:[NSArray array] cellIdentifier:CitySearchViewControllerIdentifer configureCellBlock:^(CitySeachTableViewCell* cell, id item) {
        
        cell.cityLable.text=item[@"sName"];
        
        
    }];
    
    self.citySearchView.mTableView.dataSource=self.mDataSource;
    self.citySearchView.mTableView.delegate=self;
    [self.citySearchView.mTableView registerClass:[CitySeachTableViewCell class] forCellReuseIdentifier:CitySearchViewControllerIdentifer];
}

-(void)filterData:(NSString*)cacon{
    if (cacon&&cacon.length>0) {
        NSMutableArray* adAfsf=[[NSMutableArray alloc]init];
        
        for (NSDictionary* daFAF in self.arrayConytent) {
            if ([daFAF[@"sName"] containsString:cacon]) {
                [adAfsf addObject:daFAF];
            }
        }
        self.mDataSource.items=adAfsf;
        
        
    }else{
        self.mDataSource.items=[[NSArray alloc]init];
    }
    
    [self.citySearchView.mTableView reloadData];
    
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary* adAfsf=[self.mDataSource.items objectAtIndex:indexPath.row];
    if (self.delegate) {
        [GloableInfo setChooseCityInfo:adAfsf];
        [self.delegate afaffaf:adAfsf];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.citySearchView.searchBAR resignFirstResponder];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
}


@end
