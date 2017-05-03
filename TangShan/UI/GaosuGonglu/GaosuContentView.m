//
//  GaosuContentView.m
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "GaosuContentView.h"

@implementation GaosuContentView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.bgInageView=[[UIImageView alloc]initWithImage:IMAGE(@"afaadsf")];
        self.bgInageView.frame=CGRectMake(0, 0, WIDETH, 210);
        [self addSubview:self.bgInageView];
        
        self.bgInageView1=[[UIImageView alloc]initWithImage:IMAGE(@"zhangkaidel")];
        [self addSubview:self.bgInageView1];
        
        self.titleLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.titleLable.textColor=[UIColor whiteColor];
        self.titleLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.titleLable];
        
        
        self.contentLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 100)];
        self.contentLable.textColor=[UIColor whiteColor];
        self.contentLable.font=[UIFont systemFontOfSize:14];
        self.contentLable.numberOfLines=0;
        self.contentLable.lineBreakMode=NSLineBreakByWordWrapping;
        [self addSubview:self.contentLable];
        
        self.buttton=[[UIButton alloc]initWithFrame:frame];
        [self addSubview:self.buttton];
        
    }
    
    return self;
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.buttton.center=self.center;
    
    self.bgInageView.centerX=self.centerX;
    self.bgInageView.bottom=self.bottom;
    
    [self.titleLable sizeToFit];
    self.titleLable.top=self.bgInageView.top+20;
    self.titleLable.left=self.left+20;
    
    self.bgInageView1.centerY=self.titleLable.centerY;
    self.bgInageView1.right=self.right-20;
    
    
    self.contentLable.centerX=self.centerX;
    self.contentLable.top=self.titleLable.bottom;
    
}
@end
