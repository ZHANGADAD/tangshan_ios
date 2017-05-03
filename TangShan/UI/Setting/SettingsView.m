//
//  SettingsView.m
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "SettingsView.h"

@implementation SettingsView



-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.bgImageView=[[UIImageView alloc]initWithImage:IMAGE(@"dsafs")];
        self.bgImageView.frame=CGRectMake(0, 0, WIDETH, HEIGHTH-44);
        [self addSubview:self.bgImageView];
        
        self.mScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH)];
        [self addSubview:self.mScrollView];
        
        
        self.locationLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.locationLable.textColor=[UIColor whiteColor];
        self.locationLable.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:self.locationLable];self.locationLable.text=@"设置";
        
        
        self.lable1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable1.font=[UIFont systemFontOfSize:16];
        self.lable1.textColor=[UIColor whiteColor];
        [self.mScrollView addSubview:self.lable1];
        self.lable1.text=@"推送设置";
        
        self.imageView1=[[UIImageView alloc]initWithImage:IMAGE(@"nexxxx")];
        [self.mScrollView addSubview:self.imageView1];
        
        self.button1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 60)];
        [self.button1 setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
        [self.button1 setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        self.button1.tag=0;
        [self.button1 addTarget:self action:@selector(adsasf:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button1];
        
        self.view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 1)];
        self.view1.backgroundColor=[UIColor colorWithRed:43/255.0F green:96/255.0f blue:158/255.0f alpha:0.9];
        [self.mScrollView addSubview:self.view1];
        
        
        
        self.view1111=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 60)];
        self.view1111.backgroundColor=[UIColor clearColor];
        [self.mScrollView addSubview:self.view1111];
        
        self.lable2=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable2.font=[UIFont systemFontOfSize:16];
        self.lable2.textColor=[UIColor whiteColor];
        [self.mScrollView addSubview:self.lable2];
        self.lable2.text=@"GPS设置";
        
        self.uiSwitch=[[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
        self.uiSwitch.on=YES;
        [self.mScrollView addSubview:self.uiSwitch];
        
        
        self.view2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 1)];
        self.view2.backgroundColor=[UIColor colorWithRed:43/255.0F green:96/255.0f blue:158/255.0f alpha:0.9];
        [self.mScrollView addSubview:self.view2];
        
        
        
//        self.lable3=[[UILabel alloc]initWithFrame:CGRectZero];
//        self.lable3.font=[UIFont systemFontOfSize:16];
//        self.lable3.textColor=[UIColor whiteColor];
//        [self.mScrollView addSubview:self.lable3];
//        self.lable3.text=@"购买产品";
        
        
//        self.imageView3=[[UIImageView alloc]initWithImage:IMAGE(@"nexxxx")];
//        [self.mScrollView addSubview:self.imageView3];
        
//        self.button3=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 60)];
//        [self.button3 setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
//        [self.button3 setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
//        self.button3.tag=1;
//        [self.button3 addTarget:self action:@selector(adsasf:) forControlEvents:UIControlEventTouchUpInside];
//        [self.mScrollView addSubview:self.button3];
        
//        self.view3=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 1)];
//        self.view3.backgroundColor=[UIColor colorWithRed:43/255.0F green:96/255.0f blue:158/255.0f alpha:0.9];
//        [self.mScrollView addSubview:self.view3];
        
        
        
        self.lable4=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable4.font=[UIFont systemFontOfSize:16];
        self.lable4.textColor=[UIColor whiteColor];
        [self.mScrollView addSubview:self.lable4];
        self.lable4.text=@"清除缓存";
        
        self.button4=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 60)];
        self.button4.tag=2;
        [self.button4 setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
        [self.button4 setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        [self.button4 addTarget:self action:@selector(adsasf:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.mScrollView addSubview:self.button4];
        
        self.view4=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 1)];
        self.view4.backgroundColor=[UIColor colorWithRed:43/255.0F green:96/255.0f blue:158/255.0f alpha:0.9];
        [self.mScrollView addSubview:self.view4];
        
        
        
        self.lable6=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable6.font=[UIFont systemFontOfSize:16];
        self.lable6.textColor=[UIColor whiteColor];
        [self.mScrollView addSubview:self.lable6];
        self.lable6.text=@"意见反馈";
        
        self.imageView6=[[UIImageView alloc]initWithImage:IMAGE(@"nexxxx")];
        [self.mScrollView addSubview:self.imageView6];
        
        self.button6=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 60)];
        [self.button6 setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
        [self.button6 setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        self.button6.tag=3;
        [self.button6 addTarget:self action:@selector(adsasf:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button6];
        
    }
    return self;
}

-(void)adsasf:(UIButton*)button{
    if (self.delegate) {
        [self.delegate didSelect:button.tag];
    }

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bgImageView.top=self.top;
    self.bgImageView.centerX=self.centerX;
    
    self.mScrollView.top=self.top+64;
    self.mScrollView.centerX=self.centerX;
    
    [self.locationLable sizeToFit];
    self.locationLable.centerX=self.centerX+6;
    if (IS_IPHONE_5_HEIGHT) {
        self.locationLable.top=25;
    }else if(IS_IPHONE_6P_HEIGHT){
        self.locationLable.top=35;
    }else{
        self.locationLable.top=30;
    }
    

    
    [self.lable1 sizeToFit];
    self.lable1.left=self.left+15;
    self.lable1.top=self.top+30;
    
    self.imageView1.centerY=self.lable1.centerY;
    self.imageView1.right=self.mScrollView.right-20;
    
    
    self.button1.centerY=self.lable1.centerY;
    self.button1.centerX=self.centerX;
    
    self.view1.top=self.button1.bottom;
    self.view1.centerX=self.centerX;
    
    
    self.view1111.top=self.button1.bottom;
    self.view1111.centerX=self.centerX;
    
    [self.lable2 sizeToFit];
    self.lable2.left=self.lable1.left;
    self.lable2.centerY=self.view1111.centerY;
    
    self.uiSwitch.right=self.imageView1.right;
    self.uiSwitch.centerY=self.view1111.centerY;
    
    self.view2.bottom=self.view1111.bottom;
    self.view2.centerX=self.centerX;
    
    
//    self.button3.top=self.view2.bottom;
//    self.button3.centerX=self.centerX;
//    
//    [self.lable3 sizeToFit];
//    self.lable3.left=self.lable1.left;
//    self.lable3.centerY=self.button3.centerY;
//    
//    self.imageView3.centerY=self.button3.centerY;
//    self.imageView3.right=self.imageView1.right;
//    
//    self.view3.top=self.button3.bottom;
//    self.view3.centerX=self.centerX;
    
    self.button4.top=self.view2.bottom;
    self.button4.centerX=self.centerX;
    
    
    [self.lable4 sizeToFit];
    self.lable4.left=self.lable1.left;
    self.lable4.centerY=self.button4.centerY;
    
    self.view4.top=self.button4.bottom;
    self.view4.centerX=self.centerX;
    
    
    
    
    self.button6.top=self.button4.bottom;
    self.button6.centerX=self.centerX;
    
    [self.lable6 sizeToFit];
    self.lable6.left=self.lable1.left;
    self.lable6.centerY=self.button6.centerY;
    
    self.imageView6.centerY=self.button6.centerY;
    self.imageView6.right=self.imageView1.right;
    
    
    
    
}
@end
