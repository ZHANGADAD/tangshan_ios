//
//  SettingsViewController.m
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "SettingsViewController.h"
#import "SetPushViewController.h"
#import "GoumaiViewController.h"
#import "UMFeedback.h"

@interface SettingsViewController ()<SettingsViewDelegate>

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.settingView=[[SettingsView alloc]initWithFrame:self.view.frame];
    self.settingView.delegate=self;
    [self.view addSubview:self.settingView];
    
    if ([GloableInfo getGpsInfo]==1) {
        self.settingView.uiSwitch.on=YES;
    }else{
        self.settingView.uiSwitch.on=NO;
    }
    
    [self.settingView.uiSwitch addTarget:self action:@selector(asdafsf:) forControlEvents:UIControlEventValueChanged];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSMutableDictionary* diddd=[[NSMutableDictionary alloc]init];
    [diddd setValue:@"iOS" forKey:@"platform"];
    [diddd setValue:[GloableInfo getDeviceToken] forKey:@"device_token"];
    [diddd setValue:[GloableInfo getLatitude] forKey:@"latitude"];
    [diddd setValue:[GloableInfo getLongtitude] forKey:@"longitude"];
    [diddd setValue:[GloableInfo getStartTime] forKey:@"pushtimebegin"];
    [diddd setValue:[GloableInfo getEndTime] forKey:@"pushtimeend"];
    [diddd setValue:[NSString stringWithFormat:@"%ld",(long)[GloableInfo pushInfo]] forKey:@"push"];
    [diddd setValue:[NSString stringWithFormat:@"%ld",(long)[GloableInfo pushInfoQixiang]] forKey:@"qxzhyjpush"];
    [diddd setValue:[NSString stringWithFormat:@"%ld",(long)[GloableInfo pushInfoYubao]] forKey:@"tqybpush"];
    [[HardaHttpClient sharedClient] getDataWithUrl:messageUrl withParameters:diddd deledate:self];

}

-(void)asdafsf:(UISwitch*)swedasfd{
    if (swedasfd.on) {
        [GloableInfo setGpsInfo:1];
    }else{
        [GloableInfo setGpsInfo:0];
    }
    
}

-(void)didSelect:(NSInteger)index{
    switch (index) {
        case 0:
        {
            //推送
            
            SetPushViewController* CSFASF=[[SetPushViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:CSFASF animated:YES];
            
        }
            break;
            
        case 1:
        {
            //购买
            GoumaiViewController * afcas=[[GoumaiViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:afcas animated:YES];
            
        }
            break;
            
        case 2:
        {
            //清除环讯
            [SVProgressHUD showWithStatus:@"清除中..." maskType:SVProgressHUDMaskTypeClear];
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(AFSFSF) userInfo: nil repeats:NO];
        }
            break;
            
        case 3:
        {
            //意见反馈
            [self presentViewController:[UMFeedback feedbackModalViewController] animated:YES completion:^{
            }];

        }
            break;
        default:
            break;
    }
    
}

-(void)AFSFSF{
    [SVProgressHUD dismissWithSuccess:@"清除完毕"];
}
@end
