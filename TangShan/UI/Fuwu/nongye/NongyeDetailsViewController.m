//
//  NongyeDetailsViewController.m
//  TangShan
//
//  Created by Tony on 12/21/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "NongyeDetailsViewController.h"

@interface NongyeDetailsViewController ()

@end

@implementation NongyeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailsView=[[ NongyeDetailsView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.detailsView];
    
    self.detailsView.locationLable.text=[GloableInfo getDefaultCityInfo][@"sName"];
    [self.detailsView.locationButton addTarget:self action:@selector(afsfg) forControlEvents:UIControlEventTouchUpInside];

}
-(void)afsfg{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
