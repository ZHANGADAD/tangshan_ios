//
//  CitySettingsViewController.m
//  TangShan
//
//  Created by Tony on 1/5/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CitySettingsViewController.h"
#import "RDVTabBarController.h"
#import "CityTableViewCell.h"
#import "ListDataSource.h"
#import "CityListViewController.h"


static NSString* const NongyeViewControllerIdentifer=@"NongyeViewControllerIdentiferNongyeViewControllerIdentifer";

@interface CitySettingsViewController ()<UITableViewDelegate,CityViewDelegate,CityListViewControllerDelegate,UIAlertViewDelegate>

@property(strong,nonatomic)ListDataSource* mDataSource;

@property(strong,nonatomic)UIAlertView* deleteAlertView;

@end

@implementation CitySettingsViewController
@synthesize chooseCity;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityView=[[CityView alloc]initWithFrame:self.view.frame];
    self.cityView.delegate=self;
    [self.view addSubview:self.cityView];
    [self initTableView];
}
-(void)initTableView{
    
    self.mDataSource=[[ListDataSource alloc]initWithItems:[NSArray array] cellIdentifier:NongyeViewControllerIdentifer configureCellBlock:^(CityTableViewCell* cell, id item) {
        
        NSInteger adaDASF=[self.mDataSource.items indexOfObject:item];
        
        cell.LABEAE.text=item[@"sName"];
        if ([item[@"sName"] isEqualToString:[GloableInfo getDefaultCityInfo][@"sName"]]) {
            [cell.zafsaf setHidden:YES];
        }else{
            [cell.zafsaf setHidden:YES];
        }
        cell.adsadS.tag=adaDASF;
        cell.DASSFsf.tag=adaDASF;
        [cell.adsadS addTarget:self action:@selector(showdel:) forControlEvents:UIControlEventTouchUpInside];
        [cell.DASSFsf addTarget:self action:@selector(showdel1:) forControlEvents:UIControlEventTouchUpInside];
        
        if (adaDASF==0) {
            cell.backgroundColor=[UIColor lightGrayColor];
        }else{
            cell.backgroundColor=[UIColor whiteColor];
            cell.imegaerad.image=IMAGE(@"dekee");
            if ([item[@"is2Delete"] integerValue]==1) {
                [cell.imegaerad setHidden:NO];
            }else{
                [cell.imegaerad setHidden:YES];
            }
        }
        
    }];
    self.cityView.mTableView.delegate=self;
    self.cityView.mTableView.dataSource=self.mDataSource;
    [self.cityView.mTableView registerClass:[CityTableViewCell class] forCellReuseIdentifier:NongyeViewControllerIdentifer];
    
}

-(void)getData{
    
    NSMutableDictionary* adAdFS=  [[GloableInfo getLocationCityInfo] mutableCopy];
    [adAdFS setValue:@"0" forKey:@"is2Delete"];
    [adAdFS setValue:@"0" forKey:@"isDefault"];
    NSMutableArray* aDAfs=[[NSMutableArray alloc]initWithObjects:adAdFS, nil];
    
    NSArray* ASFAFF=[GloableInfo getChooseCityInfo];
    for (NSDictionary* adaFf in ASFAFF) {
        NSMutableDictionary* aDSAffaf=[[NSMutableDictionary alloc]init];
        aDSAffaf=[adaFf mutableCopy];
        [aDSAffaf setValue:@"0" forKey:@"is2Delete"];
        [aDSAffaf setValue:@"0" forKey:@"isDefault"];
        
        [aDAfs addObject:aDSAffaf];
    }
    self.mDataSource.items= aDAfs;
    [self.cityView.mTableView reloadData];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary* ADAFS= [self.mDataSource.items objectAtIndex:indexPath.row];
    
    if ([ADAFS[@"is2Delete"] integerValue]==1) {
        
        if (indexPath.row==0) {
            [tableView deselectRowAtIndexPath:indexPath animated:NO];
            
        }
        
    }else{
        [GloableInfo setDefaultCityInfo:ADAFS[@"sName"] withStationNum:ADAFS[@"sNum"]];
        [self.navigationController popViewControllerAnimated:YES];
    }
}



-(void)showdel:(UIButton*)button{
    
    if (self.deleteAlertView) {
        self.deleteAlertView=nil;
    }
    self.deleteAlertView=[[UIAlertView alloc]initWithTitle:nil message:@"确定要删除吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    self.deleteAlertView.tag=button.tag+100;
    [self.deleteAlertView show];
    
}

-(void)showdel1:(UIButton*)button{
    
    if (self.deleteAlertView) {
        self.deleteAlertView=nil;
    }
    self.deleteAlertView=[[UIAlertView alloc]initWithTitle:nil message:@"确定要设置为默认城市吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    self.deleteAlertView.tag=button.tag;
    [self.deleteAlertView show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        NSInteger INDEEE=alertView.tag;
        if (INDEEE<100) {
            
            NSDictionary* AdaF=  [self.mDataSource.items objectAtIndex:INDEEE];
            [GloableInfo setDefaultCityInfo:AdaF[@"sName"] withStationNum:AdaF[@"sNum"]];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            INDEEE-=100;
            NSMutableArray* adafsaf= [self.mDataSource.items mutableCopy];
            [adafsaf removeObjectAtIndex:INDEEE];
            self.mDataSource.items=adafsaf;
            [self.cityView.mTableView reloadData];
            NSMutableArray* adafsaf11= [adafsaf mutableCopy];
            [adafsaf11 removeObjectAtIndex:0];
            [GloableInfo saveChooseCityInfo:adafsaf11];
        }
        
    }
}

-(void)buttonClicked:(NSInteger)index{
    if (index==0) {
        //返回
        [self.navigationController popViewControllerAnimated:YES];
    }else if (index==1){
        
        if ([self.cityView.editImageView isHidden]) {
            //编辑
            [self.cityView.editImageViewCCC setHidden:NO];
            [self.cityView.editImageView setHidden:NO];
            
            for (NSMutableDictionary* items in self.mDataSource.items) {
                items[@"is2Delete"]=@"0";
            }
            
        }else{
            //保存
            [self.cityView.editImageView setHidden:YES];
            [self.cityView.editImageViewCCC setHidden:YES];
            
            for (NSMutableDictionary* items in self.mDataSource.items) {
                items[@"is2Delete"]=@"1";
            }
        }
        [self.cityView.mTableView reloadData];
    }else{
        //添加
        CityListViewController* adaf=[[CityListViewController alloc]initWithNibName:nil bundle:nil];
        adaf.delegate=self;
        [self.navigationController pushViewController:adaf animated:YES];
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    
    if (self.chooseCity) {
        [GloableInfo setChooseCityInfo:self.chooseCity];
    }
    [self getData];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

-(void)getChooseCity:(NSDictionary*)diction{
    
    
}

@end
