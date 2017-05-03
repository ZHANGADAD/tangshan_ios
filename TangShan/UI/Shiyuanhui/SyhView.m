//
//  TqView.m
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "SyhView.h"

@implementation SyhView


-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        
        self.backGroudView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,WIDETH, HEIGHTH-44)];
        [self addSubview:self.backGroudView];
        
        
        self.ADFF=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,WIDETH, HEIGHTH-44-20)];
        [self addSubview:self.ADFF];
        
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        self.locationImageView.contentMode=UIViewContentModeScaleAspectFit;
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
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self.locationButton setBackgroundColor:[UIColor clearColor]];
        self.locationButton.tag=0;
        [self addSubview:self.locationButton];
        
        
        
        
        self.coverImageView=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:0/255.0f green:4/255.0f blue:23/255.0f alpha:0.49f]]];
        self.coverImageView.frame=CGRectMake(0, 0, WIDETH, 220);
        [self addSubview:self.coverImageView];
        
        
        self.yubaoLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.yubaoLable.textColor=[UIColor whiteColor];
        self.yubaoLable.font=[UIFont systemFontOfSize:16];
        self.yubaoLable.text=@"预报";
        [self addSubview:self.yubaoLable];
        
        
        self.dividerImageView=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:43/255.0f green:96/255.0f blue:158/255.0f alpha:0.3f]]];
        self.dividerImageView.frame=CGRectMake(0, 0, WIDETH, 1);
        [self addSubview:self.dividerImageView];
        
        
        self.afdsafsafdsgsagsagd=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH-44)];
        self.afdsafsafdsgsagsagd.pagingEnabled=YES;
        self.afdsafsafdsgsagsagd.showsHorizontalScrollIndicator=NO;
        [self addSubview:self.afdsafsafdsgsagsagd];
        
        
        self.adsaFFSAF=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 30)];
        self.adsaFFSAF.pageIndicatorTintColor=[UIColor colorWithHexString:@"0x99000000"];
        self.adsaFFSAF.currentPageIndicatorTintColor=[UIColor whiteColor];
        [self addSubview:self.adsaFFSAF];
        
        
        self.shareButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self.shareButton setBackgroundColor:[UIColor clearColor]];
        self.shareButton.tag=1;
        [self.shareButton addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.shareButton];
        
        
        
        self.conditionImage=[[UIImageView alloc]initWithImage:IMAGE(@"lianghao")];
        [self addSubview:self.conditionImage];
        
        self.conditionLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 38)];
        self.conditionLable.textColor=[UIColor whiteColor];
        self.conditionLable.textAlignment=NSTextAlignmentCenter;
        self.conditionLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.conditionLable];
        
        
        
        
        self.homeImage=[[UIImageView alloc]initWithImage:IMAGE(@"home")];
        [self addSubview:self.homeImage];
        
        self.homeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        self.homeButton.tag=3;
        [self.homeButton addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.homeButton];
        
        self.souundImage=[[UIImageView alloc]initWithImage:IMAGE(@"sound")];
        [self addSubview:self.souundImage];
        
        self.soundButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        self.soundButton.tag=4;
        [self.soundButton addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.soundButton];
        
        
        self.zhexianImage=[[UIImageView alloc]initWithImage:IMAGE(@"changeview")];
        [self addSubview:self.zhexianImage];
        
        self.zhexianButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        self.zhexianButton.tag=5;
        self.zhexianButton.backgroundColor=[UIColor clearColor];
        [self.zhexianButton addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.zhexianButton];
        
        
        self.conditionButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.conditionButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.conditionButton];
        
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
    
    self.locationButton.center=self.locationLable.center;
    
    self.shareButton.right=self.right-10;
    self.shareButton.centerY=self.locationImageView.centerY;
    
    if (IS_IPHONE_6P_HEIGHT) {
        self.ADFF.top=self.locationButton.bottom+13;
    }else{
        self.ADFF.top=self.locationButton.bottom+4;
    }
    
    self.ADFF.centerX=self.centerX;
    
    self.afdsafsafdsgsagsagd.centerX=self.centerX;
    self.afdsafsafdsgsagsagd.top=self.locationImageView.bottom;
    
    self.adsaFFSAF.top=self.locationImageView.bottom+20;
    self.adsaFFSAF.centerX=self.centerX;
    
    
    self.conditionImage.right=self.right;
    self.conditionImage.centerY=self.locationImageView.bottom+44+13;
    
    self.conditionLable.centerX=self.conditionImage.centerX+13;
    self.conditionLable.centerY=self.conditionImage.centerY;
    
    self.conditionButton.right=self.right;
    self.conditionButton.centerY=self.conditionLable.centerY;
    
    self.coverImageView.centerX=self.centerX;
    self.coverImageView.bottom=self.bottom;
    
    [self.yubaoLable sizeToFit];
    self.yubaoLable.left=self.left+15;
    self.yubaoLable.top=self.coverImageView.top+10;
    
    
    self.dividerImageView.centerX=self.centerX;
    self.dividerImageView.top=self.yubaoLable.bottom+5;
    
    
    self.zhexianImage.bottom=self.coverImageView.top-10;
    self.zhexianImage.right=self.right-15;
    self.zhexianButton.center=self.zhexianImage.center;
    
    self.souundImage.bottom=self.zhexianImage.top-15;
    self.souundImage.right=self.zhexianImage.right;
    self.soundButton.center=self.souundImage.center;
    
    self.homeImage.bottom=self.souundImage.top-15;
    self.homeImage.right=self.zhexianImage.right;
    self.homeButton.center=self.homeImage.center;
    
}

-(void)DIDselect:(UIButton*)button{
    if (!self.delegate) {
        return;
    }
    
    NSInteger adafsf=button.tag;
    if (adafsf==3) {
        if ([self.delegate respondsToSelector:@selector(didShowMain)]) {
            [self.delegate didShowMain];
        }
    }else if (adafsf==4){
        if ([self.delegate respondsToSelector:@selector(didSHOwSound)]) {
            [self.delegate didSHOwSound];
        }
    }else if (adafsf==5){
        if ([self.delegate respondsToSelector:@selector(showZhexian)]) {
            [self.delegate showZhexian];
        }
    }else if (adafsf==1){
        
        if ([self.delegate respondsToSelector:@selector(didShareSelect)]) {
            [self.delegate didShareSelect];
        }
    }
    
    
}
@end
