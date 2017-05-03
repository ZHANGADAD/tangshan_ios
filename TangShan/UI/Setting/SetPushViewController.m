//
//  SetPushViewController.m
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "SetPushViewController.h"
#import "TimeChooseViewController.h"

@interface SetPushViewController ()<TimeChooseViewControllerDelegate>

@end

@implementation SetPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.setPushView=[[SetPushView
                       alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.setPushView];
    
    [self.setPushView.button2 addTarget:self action:@selector(aDAFS) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.setPushView.button5 addTarget:self action:@selector(adasfsfasf) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.setPushView.uiSwitch.tag=1;
    self.setPushView.uiSwitch3.tag=2;
    self.setPushView.uiSwitch4.tag=3;
    
    if ([GloableInfo pushInfo]==1) {
        self.setPushView.uiSwitch.on=YES;
        if ([GloableInfo pushInfoQixiang]==1) {
            self.setPushView.uiSwitch3.on=YES;
        }else{
            self.setPushView.uiSwitch3.on=NO;
        }
        
        if ([GloableInfo pushInfoYubao]==1) {
            self.setPushView.uiSwitch4.on=YES;
        }else{
            self.setPushView.uiSwitch4.on=NO;
        }
    }else{
        self.setPushView.uiSwitch.on=NO;
        self.setPushView.uiSwitch3.on=NO;
        self.setPushView.uiSwitch4.on=NO;
        self.setPushView.uiSwitch3.enabled=NO;
        self.setPushView.uiSwitch4.enabled=NO;
        
        [GloableInfo setPushInfoQixiang:0];
        [GloableInfo setPushInfoYubao:0];
    }
    
    [self.setPushView.uiSwitch addTarget:self action:@selector(adfssasfdgf:) forControlEvents:UIControlEventValueChanged];
    [self.setPushView.uiSwitch3 addTarget:self action:@selector(adfssasfdgf:) forControlEvents:UIControlEventValueChanged];
    [self.setPushView.uiSwitch4 addTarget:self action:@selector(adfssasfdgf:) forControlEvents:UIControlEventValueChanged];
    
    self.setPushView.lable6.text=[NSString stringWithFormat:@"%@:%@--%@:%@",[[GloableInfo getStartTime] substringWithRange:NSMakeRange(0, 2)],[[GloableInfo getStartTime] substringWithRange:NSMakeRange(2, 2)],[[GloableInfo getEndTime] substringWithRange:NSMakeRange(0, 2)],[[GloableInfo getEndTime] substringWithRange:NSMakeRange(2, 2)]];
    
}

-(void)adfssasfdgf:(UISwitch*)adsfaf{
    
    if (adsfaf.on) {
        if (adsfaf.tag==1) {
            [GloableInfo setPushInfo:1];
            self.setPushView.uiSwitch3.enabled=YES;
            self.setPushView.uiSwitch4.enabled=YES;
        }else if (adsfaf.tag==2){
            [GloableInfo setPushInfoQixiang:1];
        }else{
            [GloableInfo setPushInfoYubao:1];
        }
        
    }else{
        if (adsfaf.tag==1) {
            [GloableInfo setPushInfo:0];
            [GloableInfo setPushInfoQixiang:0];
            [GloableInfo setPushInfoYubao:0];
            self.setPushView.uiSwitch3.on=NO;
            self.setPushView.uiSwitch4.on=NO;
            self.setPushView.uiSwitch3.enabled=NO;
            self.setPushView.uiSwitch4.enabled=NO;
        }else if (adsfaf.tag==2){
            [GloableInfo setPushInfoQixiang:0];
        }else{
            [GloableInfo setPushInfoYubao:0];
        }
        
    }
    
}



-(void)aDAFS{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)getTimne:(NSString*)adsaff withString:(NSString*)adFAS{
    [GloableInfo setStartTime:[NSString stringWithFormat:@"%@%@",[adsaff substringWithRange:NSMakeRange(0, 2)],[adsaff substringWithRange:NSMakeRange(3, 2)]]];
    [GloableInfo setEndTime:[NSString stringWithFormat:@"%@%@",[adFAS substringWithRange:NSMakeRange(0, 2)],[adsaff substringWithRange:NSMakeRange(3, 2)]]];
    self.setPushView.lable6.text=[NSString stringWithFormat:@"%@--%@",adsaff,adFAS];
    [self.setPushView layoutSubviews];
}

-(void)adasfsfasf{
    TimeChooseViewController* adaf=[[TimeChooseViewController alloc]initWithNibName:nil bundle:nil];
    adaf.delegate=self;
    [self.navigationController pushViewController:adaf animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
