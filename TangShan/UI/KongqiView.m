//
//  TiqiYubaoView.m
//  TangShan
//
//  Created by chemi ios on 1/1/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "KongqiView.h"
#import "UUChart.h"
#import "TianqiContentView.h"

@implementation KongqiView

-(instancetype)initWithFrame:(CGRect)frame{
    
    
    self=[super initWithFrame:frame];
    if (self) {
        
        
        self.backGroudView=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.backGroudView.frame=self.frame;
        [self addSubview:self.backGroudView];
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.locationButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.locationButton];
        
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        [self addSubview:self.locationImageView];
        
        self.locationLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.locationLable.textColor=[UIColor whiteColor];
        self.locationLable.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:self.locationLable];
        
        self.logoLableJia=[[UILabel alloc]initWithFrame:CGRectZero];
        self.logoLableJia.textColor=[UIColor whiteColor];
        self.logoLableJia.font=[UIFont systemFontOfSize:16];
        self.logoLableJia.text=@"+";
        [self addSubview:self.logoLableJia];
        [self.logoLableJia setHidden:YES];
    
        self.aaaa=[[UILabel alloc]initWithFrame:CGRectZero];
        self.aaaa.text=@"AQI指数";
        self.aaaa.textColor=[UIColor whiteColor];
        self.aaaa.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.aaaa];
        
        
        self.mTempScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, GraphViewWenDuHeight+GADAFSFF)];
        [self addSubview:self.mTempScrollView];
        
        
        self.indicatorView=[[TiqiIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        [self.mTempScrollView addSubview:self.indicatorView];
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.backGroudView.top=self.top;
    self.backGroudView.centerX=self.centerX;
    
    [self.locationLable sizeToFit];
    self.locationLable.centerX=self.centerX+6;
    if (IS_IPHONE_5_HEIGHT) {
        self.locationLable.top=25;
    }else if(IS_IPHONE_6P_HEIGHT){
        self.locationLable.top=35;
    }else{
        self.locationLable.top=30;
    }
    
    
    self.locationButton.centerY=self.locationLable.centerY;
    self.locationButton.left=self.left;
    
    self.locationImageView.centerY=self.locationLable.centerY;
    self.locationImageView.right=self.locationLable.left-10;
    
    [self.logoLableJia sizeToFit];
    self.logoLableJia.centerY=self.locationLable.centerY;
    self.logoLableJia.left=self.locationLable.right+10;
    
    [self.aaaa sizeToFit];
    self.aaaa.top=self.locationLable.bottom+40;
    self.aaaa.left=self.left+20;
    
    
    self.mTempScrollView.centerX=self.centerX;
    self.mTempScrollView.top=self.aaaa.bottom+20;
    
    if (IS_IPHONE_5_HEIGHT) {
        self.indicatorView.bottom=self.mTempScrollView.top-65;
    }else if(IS_IPHONE_6P_HEIGHT){
        self.indicatorView.bottom=self.mTempScrollView.top-77;
    }else{
        self.indicatorView.bottom=self.mTempScrollView.top-25;
    }
    self.indicatorView.left=self.mTempScrollView.left+15;
}


-(float)getTextLength:(UILabel*)adad{
    
    CGSize titleSize = [adad.text sizeWithFont:adad.font constrainedToSize:CGSizeMake(MAXFLOAT, adad.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    return titleSize.width;
}
@end
