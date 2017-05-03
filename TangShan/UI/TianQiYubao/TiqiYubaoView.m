//
//  TiqiYubaoView.m
//  TangShan
//
//  Created by chemi ios on 1/1/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TiqiYubaoView.h"
#import "UUChart.h"

@implementation TiqiYubaoView

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
        
        
        
        self.mScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH-44)];
        self.mScrollView.pagingEnabled=YES;
        self.mScrollView.showsHorizontalScrollIndicator=NO;
        [self addSubview:self.mScrollView];
        
        
        self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 30)];
        self.pageControl.pageIndicatorTintColor=[UIColor lightGrayColor];
        self.pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
        [self addSubview:self.pageControl];
        
  
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
    
    self.pageControl.centerX=self.centerX;
    self.pageControl.top=self.locationLable.bottom+10;
    
    
    self.mScrollView.top=self.pageControl.bottom;
    self.mScrollView.centerX=self.centerX;
}


-(float)getTextLength:(UILabel*)adad{
    
    CGSize titleSize = [adad.text sizeWithFont:adad.font constrainedToSize:CGSizeMake(MAXFLOAT, adad.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    return titleSize.width;
}
@end
