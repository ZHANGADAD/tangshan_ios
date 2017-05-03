//
//  TimeChooseViewController.m
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TimeChooseViewController.h"

@interface TimeChooseViewController ()

@end

@implementation TimeChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.DAAsf=[[TimeView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.DAAsf];
    [self.DAAsf.button2 addTarget:self action:@selector(adafafs) forControlEvents:UIControlEventTouchUpInside];
    
   [ self.DAAsf.button3 addTarget:self action:@selector(adaf) forControlEvents:UIControlEventTouchUpInside];
    
    NSDateFormatter* DADSADASD=[[NSDateFormatter alloc]init];
    DADSADASD.dateFormat=@"HHmm";
    
    NSDate* startDate=[[NSDate alloc]initWithTimeIntervalSince1970:[[DADSADASD dateFromString:[GloableInfo getStartTime]] timeIntervalSince1970]];
    [self.DAAsf.picker1 setDate:startDate];
    
    NSDate* endDate=[[NSDate alloc]initWithTimeIntervalSince1970:[[DADSADASD dateFromString:[GloableInfo getEndTime]] timeIntervalSince1970]];
    [self.DAAsf.picker2 setDate:endDate];
    
}

-(void)adafafs{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)adaf{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if (self.delegate) {
        NSDateFormatter* adafsf=[[NSDateFormatter alloc]init];
        [adafsf setDateFormat:@"HH:mm"];
        
        [self.delegate getTimne:[adafsf stringFromDate:self.DAAsf.picker1.date] withString:[adafsf stringFromDate:self.DAAsf.picker2.date]];
    }

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
