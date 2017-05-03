//
//  CityListViewController.m
//  TangShan
//
//  Created by Tony on 1/5/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CityListViewController.h"
#import "RDVTabBarController.h"
#import "CitySearchViewController.h"
#import "TianqiViewController.h"


@interface CityListViewController ()<CityListViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,CitySearchViewControllerDelegate>

@property(strong,nonatomic)NSMutableArray* mDataSource;
@end

@implementation CityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.cityListView=[[CityListView alloc]initWithFrame:self.view.frame];
    self.cityListView.delegate=self;
    [self.view addSubview:self.cityListView];
    
    [self setUpccd];
    
    [self getData];
    
}

-(void)afaffaf:(NSDictionary*)adaff{
//    if (self.delegate) {
//        [self.delegate getChooseCity:adaff];
//    }
   NSArray* ADAffsaf= [self.navigationController viewControllers];
    UIViewController* ADAf=nil;
   
    for (NSInteger i=0; i<ADAffsaf.count; i++) {
        UIViewController * vdsadafsf=[ADAffsaf objectAtIndex:i];
        if ([vdsadafsf isKindOfClass:[TianqiViewController class]]) {
            ADAf=vdsadafsf;
            [(TianqiViewController*)vdsadafsf reeefreshData:adaff];
        }
    }
    [self.navigationController popToViewController:ADAf animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:@"0x000000"]];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:@"0xffffff"]];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

-(void)buttonClicked:(NSInteger)indexButton{
    if (indexButton==0) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if (indexButton==1){
        //more
        [self.cityListView.moreButton setHidden:YES];
        self.cityListView.collectionmView.frame=CGRectMake(self.cityListView.collectionmView.frame.origin.x, self.cityListView.collectionmView.frame.origin.y, self.cityListView.collectionmView.frame.size.width, HEIGHTH-64-100-84);
        
        
        NSMutableArray* adaf=  [GloableInfo getMoreCityData];
        
        NSInteger ADAfsf=adaf.count%4;
        if (ADAfsf!=0) {
            for (NSInteger i=(4-ADAfsf); i>0; i--) {
                [adaf  addObject:@{@"sNum":@" ",@"sName":@" "}];
            }
        }
        
        [self.mDataSource addObjectsFromArray:adaf];
        
        [self.cityListView.collectionmView reloadData];
    }else{
        //search
        CitySearchViewController* DAfsAS=[[CitySearchViewController alloc]initWithNibName:nil bundle:nil];
        DAfsAS.type=0;
        DAfsAS.delegate=self;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:DAfsAS];
        [nav.navigationBar setOpaque:NO];
        [self presentViewController:nav animated:YES completion:nil];
        
    }
}

-(void)getData{
    NSArray* arrayCity= [GloableInfo getHotCityData];
    NSMutableArray* ASDASFAF=[[NSMutableArray alloc]initWithArray:arrayCity];
    NSInteger ADAfsf=arrayCity.count%4;
    if (ADAfsf!=0) {
        for (NSInteger i=(4-ADAfsf); i>0; i--) {
            [ASDASFAF  addObject:@{@"sNum":@" ",@"sName":@" "}];
        }
    }
    self.mDataSource=ASDASFAF;
    [self.cityListView.collectionmView reloadData];
}

-(void)setUpccd{
    self.cityListView.collectionmView.dataSource=self;
    self.cityListView.collectionmView.delegate=self;
    
    [self.cityListView.collectionmView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.mDataSource.count/4;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ((WIDETH-40)-3)/4, 60)];
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithHexString:@"0x333333"];
    
    NSArray * daFAA=[self GETiDAFSAF:indexPath];
    label.text = [NSString stringWithFormat:@"%@",[daFAA objectAtIndex:indexPath.row][@"sName"]];
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    [cell.contentView addSubview:label];
    return cell;
}

-(NSArray*)GETiDAFSAF:(NSIndexPath*)PATH{
    return [self.mDataSource subarrayWithRange:NSMakeRange(PATH.section*4, 4)];
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(((WIDETH-40)-3)/4, 60);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 0, 0, 0);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    NSArray* DAsdsafd=  [self GETiDAFSAF:indexPath];
    [GloableInfo setChooseCityInfo:[DAsdsafd objectAtIndex:indexPath.row]];
    [self afaffaf:[DAsdsafd objectAtIndex:indexPath.row]];
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}
//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}




@end
