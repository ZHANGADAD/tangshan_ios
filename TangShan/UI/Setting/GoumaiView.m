//
//  GoumaiView.m
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "GoumaiView.h"

@implementation GoumaiView




-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.bgImageView=[[UIImageView alloc]initWithImage:IMAGE(@"goumai")];
        self.bgImageView.frame=self.frame;
        [self addSubview:self.bgImageView];
        
        
        self.button1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 60)];
        self.button1.backgroundColor=[UIColor clearColor];
        [self addSubview:self.button1];
        

        self.button2=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 60)];
        self.button2.backgroundColor=[UIColor clearColor];
        [self addSubview:self.button2];
        
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bgImageView.top=self.top;
    self.bgImageView.centerX=self.centerX;
    
    
    self.button1.top=self.top+70;
    self.button1.right=self.right;
    
    self.button2.top=self.top;
    self.button2.left=self.left;
}
@end
