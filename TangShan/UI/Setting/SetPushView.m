//
//  SetPushView.m
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "SetPushView.h"

@implementation SetPushView



-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.bgImageView=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.bgImageView.frame=self.frame;
        [self addSubview:self.bgImageView];

        
        self.button2=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 60)];
        self.button2.backgroundColor=[UIColor clearColor];
        [self addSubview:self.button2];
        
        
        self.lable1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable1.font=[UIFont systemFontOfSize:18];
        self.lable1.textColor=[UIColor whiteColor];
        [self addSubview:self.lable1];
        self.lable1.text=@"推送通知";
        
        self.lable2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 60)];
        self.lable2.font=[UIFont systemFontOfSize:16];
        self.lable2.numberOfLines=2;
        self.lable2.textColor=[UIColor lightGrayColor];
        [self addSubview:self.lable2];
        self.lable2.text=@"关闭后，您将不再收到任何推送通知，有可能因此漏掉重要的天气通知";
        
        self.uiSwitch=[[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
        self.uiSwitch.on=YES;
        [self addSubview:self.uiSwitch];
        
        
        self.view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 1)];
        self.view1.backgroundColor=[UIColor colorWithRed:43/255.0F green:96/255.0f blue:158/255.0f alpha:0.9];
        [self addSubview:self.view1];
        
        
        
        
        self.lable3=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable3.font=[UIFont systemFontOfSize:18];
        self.lable3.textColor=[UIColor whiteColor];
        [self addSubview:self.lable3];
        self.lable3.text=@"气象灾害预警";
        
        
        self.uiSwitch3=[[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
        self.uiSwitch3.on=YES;
        [self addSubview:self.uiSwitch3];
        
        
        self.view3=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 1)];
        self.view3.backgroundColor=[UIColor colorWithRed:43/255.0F green:96/255.0f blue:158/255.0f alpha:0.9];
        [self addSubview:self.view3];
        
        
        
        self.lable4=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable4.font=[UIFont systemFontOfSize:18];
        self.lable4.textColor=[UIColor whiteColor];
        [self addSubview:self.lable4];
        self.lable4.text=@"天气预报";
        
        
        self.uiSwitch4=[[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
        self.uiSwitch4.on=YES;
        [self addSubview:self.uiSwitch4];
        
        
        self.view4=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 1)];
        self.view4.backgroundColor=[UIColor colorWithRed:43/255.0F green:96/255.0f blue:158/255.0f alpha:0.9];
        [self addSubview:self.view4];
        
        
        
        self.lable5=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable5.font=[UIFont systemFontOfSize:18];
        self.lable5.textColor=[UIColor whiteColor];
        [self addSubview:self.lable5];
        self.lable5.text=@"推送时间设置";
        
        self.lable6=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable6.font=[UIFont systemFontOfSize:18];
        self.lable6.textColor=[UIColor whiteColor];
        [self addSubview:self.lable6];
        self.lable6.text=@"07:00--22:00";
        
        self.imageView5=[[UIImageView alloc]initWithImage:IMAGE(@"nexxxx")];
        [self addSubview:self.imageView5];
        
        self.button5=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 60)];
        self.button5.backgroundColor=[UIColor clearColor];
        [self addSubview:self.button5];
        
        self.view5=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 1)];
        self.view5.backgroundColor=[UIColor colorWithRed:43/255.0F green:96/255.0f blue:158/255.0f alpha:0.9];
        [self addSubview:self.view5];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bgImageView.top=self.top;
    self.bgImageView.centerX=self.centerX;
    
    self.button2.top=self.top+5;
    self.button2.left=self.left;
    
    [self.lable1 sizeToFit];
    self.lable1.left=self.left+20;
    self.lable1.top=self.top+64+20+20;
    
    self.uiSwitch.centerY=self.lable1.centerY;
    self.uiSwitch.right=self.right-20;
    
    self.lable2.left=self.lable1.left;
    self.lable2.top=self.lable1.bottom;
    
    self.view1.centerX=self.centerX;
    self.view1.top=self.lable2.bottom+10;
    
    
    
    
    [self.lable3 sizeToFit];
    self.lable3.left=self.lable1.left;
    self.lable3.top=self.view1.bottom+17;
    
    self.uiSwitch3.centerY=self.lable3.centerY;
    self.uiSwitch3.left=self.uiSwitch.left;
    
    self.view3.top=self.uiSwitch3.bottom+20;
    self.view3.centerX=self.centerX;

    

    [self.lable4 sizeToFit];
    self.lable4.left=self.lable1.left;
    self.lable4.top=self.view3.bottom+17;
    
    self.uiSwitch4.centerY=self.lable4.centerY;
    self.uiSwitch4.left=self.uiSwitch.left;
    
    self.view4.top=self.uiSwitch4.bottom+20;
    self.view4.centerX=self.centerX;
    
  
    
    self.button5.top=self.view4.bottom;
    self.button5.centerX=self.centerX;
    
    [self.lable5 sizeToFit];
    self.lable5.left=self.lable1.left;
    self.lable5.centerY=self.button5.centerY;
    
    self.imageView5.centerY=self.lable5.centerY;
    self.imageView5.right=self.uiSwitch.right;
    
    [self.lable6 sizeToFit];
    self.lable6.centerY=self.lable5.centerY;
    self.lable6.right=self.imageView5.left;
    
    self.view5.centerX=self.centerX;
    self.view5.top=self.button5.bottom;
    
}
@end
