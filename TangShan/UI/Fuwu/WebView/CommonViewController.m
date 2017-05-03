//
//  CommonViewController.m
//  TangShan
//
//  Created by Tony on 1/6/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CommonViewController.h"
#import "RDVTabBarController.h"

@interface CommonViewController ()<UMSocialShareMenuViewDelegate>

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.commonView=[[CommonView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.commonView];
    
    self.commonView.locationImageView.image=nil;
    if ([self.url containsString:@"lyqx.php"]) {
        self.commonView.locationLable.text=@"旅游气象";
    }else if ([self.url containsString:@"syh.php"]){
        self.commonView.locationLable.text=@"世园会气象";
    }else {
        self.commonView.locationLable.text=@"气象科普";
    }
    
    
    [self.commonView.locationButton addTarget:self action:@selector(affdg) forControlEvents:UIControlEventTouchUpInside];
    

    
//    [self.commonView.locationButtonSssss addTarget:self action:@selector(didShareSelect) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSURLRequest* afasf=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.url]];
    [self.commonView.mWebView loadRequest:afasf];
}

-(void)affdg{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)didShareSelect{
    
    
    [self.rdv_tabBarController setTabBarHidden:YES];
    
    NSString* title=@"世园气象";
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:@"Desc" thumImage:IMAGE(@"llll")];
    //设置网页地址
    shareObject.webpageUrl = self.url;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        if (platformType==UMSocialPlatformType_Sms) {
            messageObject.text = [NSString stringWithFormat:@"%@ %@",self.commonView.locationLable.text,self.url];
            messageObject.shareObject =nil;
        }
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                NSLog(@"response data is %@",data);
                [self.rdv_tabBarController setTabBarHidden:NO];
            }
        }];
        
    }];

}

#pragma mark - UMSocialShareMenuViewDelegate
- (void)UMSocialShareMenuViewDidAppear
{
    [self.rdv_tabBarController setTabBarHidden:YES];
}
- (void)UMSocialShareMenuViewDidDisappear
{
    [self.rdv_tabBarController setTabBarHidden:NO];
}


@end
