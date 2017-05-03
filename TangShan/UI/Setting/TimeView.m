//
//  TimeView.m
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TimeView.h"

@implementation TimeView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        
        self.bgImageView=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.bgImageView.frame=self.frame;
        [self addSubview:self.bgImageView];
        
        
        self.button2=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 60)];
        self.button2.backgroundColor=[UIColor clearColor];
        [self addSubview:self.button2];
        
        self.button3=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 60)];
        [self.button3 setTitle:@"确定" forState:UIControlStateNormal];
        [self.button3 setTitle:@"确定" forState:UIControlStateHighlighted];
        
        [self.button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.button3 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [self addSubview:self.button3];
        
        
        self.picker1=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, WIDETH/2-40, 300)];
        self.picker1.datePickerMode=UIDatePickerModeTime;
        self.picker1.tintColor=[UIColor whiteColor];
        [self.picker1 setValue:[UIColor whiteColor] forKey:@"textColor"];
        self.picker1.backgroundColor=[UIColor clearColor];
        [self addSubview:self.picker1];
        
        
        self.picker2=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, WIDETH/2-40, 300)];
        self.picker2.datePickerMode=UIDatePickerModeTime;
        self.picker2.tintColor=[UIColor whiteColor];
        [self.picker2 setValue:[UIColor whiteColor] forKey:@"textColor"];
        self.picker2.backgroundColor=[UIColor clearColor];
        [self addSubview:self.picker2];
    }
    return self;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bgImageView.top=self.top;
    self.bgImageView.centerX=self.centerX;
    
    self.button2.top=self.top+5;
    self.button2.left=self.left;
    
    self.button3.top=self.button2.top+6;
    self.button3.right=self.right;
    
    
    
    self.picker1.centerY=self.centerY;
    self.picker1.left=self.left+20;
    
    self.picker2.top=self.picker1.top;
    self.picker2.left=self.picker1.right+10;
}
@end
