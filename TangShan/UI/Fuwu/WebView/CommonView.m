//
//  CommonView.m
//  TangShan
//
//  Created by Tony on 1/6/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CommonView.h"

@implementation CommonView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.imageView=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.imageView.frame=self.frame;
        [self addSubview:self.imageView];
        
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
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.locationButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.locationButton];
        
        
        
        self.locationButtonSssss=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.locationButtonSssss.backgroundColor=[UIColor clearColor];
        [self addSubview:self.locationButtonSssss];
        

        self.mWebView=[[UIWebView alloc]initWithFrame:frame];
       self.mWebView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [ self.mWebView setScalesPageToFit:YES];
        [self.mWebView setUserInteractionEnabled:YES];
        [self addSubview:self.mWebView];
        
    }
    return self;

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.imageView.top=self.top;
    self.imageView.centerX=self.centerX;

    
    [self.locationLable sizeToFit];
    self.locationLable.centerX=self.centerX+6;
    if (IS_IPHONE_5_HEIGHT) {
        self.locationLable.top=25;
    }else if(IS_IPHONE_6P_HEIGHT){
        self.locationLable.top=35;
    }else{
        self.locationLable.top=30;
    }
    
    self.locationButtonSssss.right=self.right;
    self.locationButtonSssss.centerY=self.locationLable.centerY;
    
    self.locationButton.left=self.left;
    self.locationButton.centerY=self.locationLable.centerY;
    
    self.locationImageView.centerY=self.locationLable.centerY;
    self.locationImageView.right=self.locationLable.left-10;
    
    [self.logoLableJia sizeToFit];
    self.logoLableJia.centerY=self.locationLable.centerY;
    self.logoLableJia.left=self.locationLable.right+1;
    
    self.mWebView.top=self.top+64+5;
    self.mWebView.centerX=self.centerX;

}


@end
