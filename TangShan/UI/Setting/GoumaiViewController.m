//
//  GoumaiViewController.m
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "GoumaiViewController.h"
#import <MessageUI/MFMessageComposeViewController.h>

@interface GoumaiViewController ()<MFMessageComposeViewControllerDelegate,UIAlertViewDelegate>

@end

@implementation GoumaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.afasf=[[GoumaiView
                 alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.afasf];
    
    [self.afasf.button1
     addTarget:self action:@selector(adafS) forControlEvents:UIControlEventTouchUpInside];
    [self.afasf.button2
     addTarget:self action:@selector(adaddfS) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)adaddfS{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)adafS{
    
    BOOL canSendSMS = [MFMessageComposeViewController canSendText];
    if(canSendSMS){
        MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
        picker.recipients=[NSArray arrayWithObject:@"10085"];
        picker.body=[NSString stringWithFormat:@"唐山气象%@",@"好"];
        picker.messageComposeDelegate=self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    if (result==MessageComposeResultCancelled) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        UIAlertView* ADAFF=[[UIAlertView alloc]initWithTitle:nil message:@"购买成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [ADAFF show];
        
    }
    
}


// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self dismissViewControllerAnimated:YES completion:nil];
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
