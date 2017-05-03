//
//  FiveDayView.m
//  TangShan
//
//  Created by chemi ios on 3/6/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "FiveDayView.h"

@implementation FiveDayView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        
        self.backGroudView=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.backGroudView.frame=self.frame;
        [self addSubview:self.backGroudView];
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.locationButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.locationButton];
        
        
        
        self.ADAFFSadsf=[[UIView alloc]initWithFrame:self.frame];
        [self addSubview:self.ADAFFSadsf];
        self.ADAFFSadsf.backgroundColor=[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.4];
        [self.ADAFFSadsf setHidden:YES];
        
        
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
        
        
        self.lableWenDu=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lableWenDu.textColor=[UIColor whiteColor];
        self.lableWenDu.font=[UIFont systemFontOfSize:16];
        self.lableWenDu.text=@"5日天气预报";
        [self addSubview:self.lableWenDu];
        
        
        
        self.mScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH)];
        self.mScrollView.pagingEnabled=YES;
        self.mScrollView.showsHorizontalScrollIndicator=NO;
        [self addSubview:self.mScrollView];
        
        
        self.mPageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 30)];
        self.mPageControl.pageIndicatorTintColor=[UIColor colorWithHexString:@"0x99000000"];
        self.mPageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
        [self addSubview:self.mPageControl];
        
        
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
    
    
    self.locationImageView.centerY=self.locationLable.centerY;
    self.locationImageView.right=self.locationLable.left-10;
    
    [self.logoLableJia sizeToFit];
    self.logoLableJia.centerY=self.locationLable.centerY;
    self.logoLableJia.left=self.locationLable.right+10;
    
    self.locationButton.centerY=self.locationLable.centerY;
    self.locationButton.left=self.left;
    
    self.ADAFFSadsf.top=self.locationImageView.bottom+13;
    self.ADAFFSadsf.centerX=self.centerX;
    
    [self.lableWenDu sizeToFit];
    self.lableWenDu.left=self.left+10;
    self.lableWenDu.top=self.locationImageView.bottom+30;
    

    self.mScrollView.centerX=self.centerX;
    self.mScrollView.top=self.lableWenDu.bottom+10;
    
    
    self.mPageControl.top=self.locationLable.bottom-2;
    self.mPageControl.centerX=self.centerX;
    
    
}
@end
