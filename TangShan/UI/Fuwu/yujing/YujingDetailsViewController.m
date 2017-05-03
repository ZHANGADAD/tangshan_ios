//
//  YujingDetailsViewController.m
//  TangShan
//
//  Created by Tony on 1/25/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "YujingDetailsViewController.h"

@interface YujingDetailsViewController ()

@end

@implementation YujingDetailsViewController
@synthesize mDictionary;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.yujingDetailsView=[[YujingDetailsView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.yujingDetailsView];
    
    self.yujingDetailsView.locationLable.text=@"唐山";
    self.yujingDetailsView.locationImageView.image=nil;
//    
//    if ([self.yujingDetailsView.locationLable.text isEqual:[GloableInfo getLocationCityInfo][@"sName"]]) {
//        self.yujingDetailsView.locationImageView.image=IMAGE(@"location");
//    }else{
//        self.yujingDetailsView.locationImageView.image=nil;
//    }
//    
    [self.yujingDetailsView.locationButton addTarget:self action:@selector(adasfsf) forControlEvents:UIControlEventTouchUpInside];
    
    self.yujingDetailsView.yujingImageView.image=[self getImage];
    self.yujingDetailsView.yujingTitleLable.text=[NSString stringWithFormat:@"%@%@%@%@预警",self.mDictionary[@"releaser"],self.mDictionary[@"state"],self.mDictionary[@"type"],self.mDictionary[@"level"]];
    self.yujingDetailsView.yujingTimeLable.text=[self getDateFromString:self.mDictionary[@"date"]];
    
    self.yujingDetailsView.yujingContentLable.text=self.mDictionary[@"desc"];
}

-(NSString*)getDateFromString:(NSString*)adadf{
    NSDateFormatter* ADAFFa=[[NSDateFormatter alloc]init];
    if (adadf.length==10) {
        [ADAFFa setDateFormat:@"yyyyMMddHH"];
    }else{
        [ADAFFa setDateFormat:@"yyyyMMddHHmmss"];
    }
    
    NSDate* dada= [ADAFFa dateFromString:adadf];
    [ADAFFa setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [ADAFFa stringFromDate:dada];
}


-(void)adasfsf{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIImage*)getImage{
    NSString* daolu=  self.mDictionary[@"type"];
    NSString* huangse=self.mDictionary[@"level"];
    NSString* dsafsf;
    if ([daolu containsString:@"台风"]) {
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"taifenglans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"taifenghuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"taifengchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"taifenghongs";
        }
    }else if ([daolu containsString:@"暴雨"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"baoyulans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"baoyuhuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"baoyuchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"baoyuhongs";
        }
    }else if ([daolu containsString:@"暴雪"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"baoxuelans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"baoxuehuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"baoxuechengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"baoxuehongs";
        }
    }else if ([daolu containsString:@"寒潮"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"hanchaolans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"hanchaohuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"hanchaochengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"hanchaohongs";
        }
    }else if ([daolu containsString:@"大风"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"dafenglans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"dafenghuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"dafengchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"dafenghongs";
        }
    }else if ([daolu containsString:@"沙尘暴"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"shalans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"shahuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"shachengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"shahongs";
        }
    }else if ([daolu containsString:@"高温"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"gaolans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"gaohuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"gaochengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"gaohongs";
        }
    }else if ([daolu containsString:@"干旱"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"ganlans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"ganhuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"ganchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"ganhongs";
        }
    }else if ([daolu containsString:@"雷电"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"leilans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"leihuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"leichengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"leihongs";
        }
    }else if ([daolu containsString:@"冰雹"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"binglans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"binghuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"bingchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"binghongs";
        }
    }else if ([daolu containsString:@"霜冻"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"shuanglans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"shuanghuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"shuangchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"shuanghongs";
        }
    }else if ([daolu containsString:@"大雾"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"wulans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"wuhuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"wuchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"wuhongs";
        }
    }else if ([daolu containsString:@"霾"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"mailans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"maihuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"maichengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"maihongs";
        }
    }else if ([daolu containsString:@"道路结冰"]){
        if ([huangse containsString:@"蓝"]){
            dsafsf=@"llans";
        }else  if ([huangse containsString:@"黄"]) {
            dsafsf=@"lhuangs";
        }else if ([huangse containsString:@"橙"]){
            dsafsf=@"lchengs";
        }else if ([huangse containsString:@"红"]){
            dsafsf=@"lhongs";
        }
    }
    return IMAGE(dsafsf);
}

@end
