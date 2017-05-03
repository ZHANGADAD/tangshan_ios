//
//  TSBaseViewController.m
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "TSBaseViewController.h"

@interface TSBaseViewController ()

@property(strong,nonatomic)UIImageView* backgroud;

@end

@implementation TSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addBgView];
    [self.navigationController setNavigationBarHidden:YES];
    if (IS_IOS7_OR_LATER) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        [self.navigationController.navigationBar setTranslucent:NO];
        [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:@"0xffffff"]];
    }
}

-(void)addBgView{
    self.view.backgroundColor=[UIColor colorWithHexString:@"0x000000"];
}


@end
