//
//  TqView.m
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "TqView.h"

@implementation TqView


-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        
        self.backGroudView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,WIDETH, HEIGHTH-44)];
        [self addSubview:self.backGroudView];
        
        
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
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self.locationButton setBackgroundColor:[UIColor clearColor]];
        self.locationButton.tag=0;
        [self.locationButton addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.locationButton];
        
        //        self.logoImageView=[[UIImageView alloc]initWithImage:IMAGE(@"daohangicon")];
        //        [self addSubview:self.logoImageView];
        //
        //        self.logoLable=[[UILabel alloc]initWithFrame:CGRectZero];
        //        self.logoLable.textColor=[UIColor whiteColor];
        //        self.logoLable.text=@"唐山气象局";
        //        self.logoLable.font=[UIFont systemFontOfSize:22];
        //        [self addSubview:self.logoLable];
        //
        //
        //        self.shareImageView=[[UIImageView alloc]initWithImage:IMAGE(@"share")];
        //        [self addSubview:self.shareImageView];
        
        self.shareButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self.shareButton setBackgroundColor:[UIColor clearColor]];
        self.shareButton.tag=1;
        [self.shareButton addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.shareButton];
        
        
        
        self.cityLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.cityLable.textColor=[UIColor whiteColor];
        self.cityLable.font=[UIFont boldSystemFontOfSize:22];
        [self addSubview:self.cityLable];
        
        self.cityImage=[[UIImageView alloc]initWithImage:IMAGE(@"tanhao")];
        [self addSubview:self.cityImage];
        [self.cityImage setHidden:YES];
        
        self.cityButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        self.cityButton.backgroundColor=[UIColor clearColor];
        self.cityButton.tag=10;
        [self.cityButton addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cityButton];
        [self.cityButton setHidden:YES];
        
        self.weekLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.weekLable.textColor=[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.6f];
        self.weekLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.weekLable];
        
        self.timeLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLable.textColor=[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.6f];
        self.timeLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.timeLable];
        
        
        self.conditionImage=[[UIImageView alloc]initWithImage:IMAGE(@"lianghao")];
        [self addSubview:self.conditionImage];
        
        self.conditionLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 38)];
        self.conditionLable.textColor=[UIColor whiteColor];
        self.conditionLable.textAlignment=NSTextAlignmentCenter;
        self.conditionLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.conditionLable];
        
        
        self.tempLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.tempLabel.textColor=[UIColor whiteColor];
        self.tempLabel.font=[UIFont systemFontOfSize:60];
        [self addSubview:self.tempLabel];
        
        
        self.tempLabelUnit=[[UILabel alloc]initWithFrame:CGRectZero];
        self.tempLabelUnit.textColor=[UIColor whiteColor];
        self.tempLabelUnit.font=[UIFont boldSystemFontOfSize:20];
        [self addSubview:self.tempLabelUnit];
        
        
        self.tempQingyinLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.tempQingyinLable.textColor=[UIColor whiteColor];
        self.tempQingyinLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.tempQingyinLable];
        
        
        self.tempImage=[[UIImageView alloc]initWithImage:IMAGE(@"nextyuan")];
        [self addSubview:self.tempImage];
        
        self.fengxiangLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fengxiangLable.textColor=[UIColor whiteColor];
        self.fengxiangLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.fengxiangLable];
        
        
        
        self.qiyaLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.qiyaLable.textColor=[UIColor whiteColor];
        self.qiyaLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.qiyaLable];
        
        
        self.buttonNext=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 100)];
        [self.buttonNext setBackgroundColor:[UIColor clearColor]];
        self.buttonNext.tag=2;
        [self.buttonNext addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.buttonNext];
        
        
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
        [self.zhexianButton addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.zhexianButton];
        
        self.coverImageView=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:0/255.0f green:4/255.0f blue:23/255.0f alpha:0.49f]]];
        self.coverImageView.frame=CGRectMake(0, 0, WIDETH, 300);
        [self addSubview:self.coverImageView];
        
        
        self.yubaoLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.yubaoLable.textColor=[UIColor whiteColor];
        self.yubaoLable.font=[UIFont systemFontOfSize:16];
        self.yubaoLable.text=@"预报";
        [self addSubview:self.yubaoLable];
        
        
        self.btToday=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        [self.btToday setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.btToday setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [self.btToday setTitle:@"今日看点+" forState:UIControlStateHighlighted];
        [self.btToday setTitle:@"今日看点+" forState:UIControlStateNormal];
        self.btToday.titleLabel.textAlignment=NSTextAlignmentRight;
        [self.btToday.titleLabel setFont:[UIFont systemFontOfSize:16]];
        self.btToday.backgroundColor=[UIColor clearColor];
        [self addSubview:self.btToday];
        
        
        self.dividerImageView=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:43/255.0f green:96/255.0f blue:158/255.0f alpha:0.3f]]];
        self.dividerImageView.frame=CGRectMake(0, 0, WIDETH, 1);
        [self addSubview:self.dividerImageView];
        
        
        self.onedayLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.onedayLable.textColor=[UIColor grayColor];
        self.onedayLable.numberOfLines=1;
        self.onedayLable.textAlignment=NSTextAlignmentCenter;
        self.onedayLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.onedayLable];
        
        
        self.onedayLableY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.onedayLableY.textColor=[UIColor grayColor];
        self.onedayLableY.numberOfLines=1;
        self.onedayLableY.textAlignment=NSTextAlignmentCenter;
        self.onedayLableY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.onedayLableY];
        self.onedayLableYN=[[UILabel alloc]initWithFrame:CGRectZero];
        self.onedayLableYN.textColor=[UIColor grayColor];
        self.onedayLableYN.numberOfLines=1;
        self.onedayLableYN.textAlignment=NSTextAlignmentCenter;
        self.onedayLableYN.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.onedayLableYN];
        
        
        self.twodayLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.twodayLable.textColor=[UIColor whiteColor];
        self.twodayLable.numberOfLines=1;
        self.twodayLable.textAlignment=NSTextAlignmentCenter;
        self.twodayLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.twodayLable];
        
        self.twodayLableY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.twodayLableY.textColor=[UIColor whiteColor];
        self.twodayLableY.numberOfLines=1;
        self.twodayLableY.textAlignment=NSTextAlignmentCenter;
        self.twodayLableY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.twodayLableY];
        self.twodayLableYN=[[UILabel alloc]initWithFrame:CGRectZero];
        self.twodayLableYN.textColor=[UIColor whiteColor];
        self.twodayLableYN.numberOfLines=1;
        self.twodayLableYN.textAlignment=NSTextAlignmentCenter;
        self.twodayLableYN.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.twodayLableYN];
        
        
        self.threedayLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.threedayLable.textColor=[UIColor whiteColor];
        self.threedayLable.numberOfLines=1;
        self.threedayLable.textAlignment=NSTextAlignmentCenter;
        self.threedayLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.threedayLable];
        
        
        self.threedayLableY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.threedayLableY.textColor=[UIColor whiteColor];
        self.threedayLableY.numberOfLines=1;
        self.threedayLableY.textAlignment=NSTextAlignmentCenter;
        self.threedayLableY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.threedayLableY];
        self.threedayLableYN=[[UILabel alloc]initWithFrame:CGRectZero];
        self.threedayLableYN.textColor=[UIColor whiteColor];
        self.threedayLableYN.numberOfLines=1;
        self.threedayLableYN.textAlignment=NSTextAlignmentCenter;
        self.threedayLableYN.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.threedayLableYN];
        
        
        self.fourdayLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fourdayLable.textColor=[UIColor whiteColor];
        self.fourdayLable.numberOfLines=1;
        self.fourdayLable.textAlignment=NSTextAlignmentCenter;
        self.fourdayLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.fourdayLable];
        
        
        self.fourdayLableY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fourdayLableY.textColor=[UIColor whiteColor];
        self.fourdayLableY.numberOfLines=1;
        self.fourdayLableY.textAlignment=NSTextAlignmentCenter;
        self.fourdayLableY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.fourdayLableY];
        
        self.fourdayLableYN=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fourdayLableYN.textColor=[UIColor whiteColor];
        self.fourdayLableYN.numberOfLines=1;
        self.fourdayLableYN.textAlignment=NSTextAlignmentCenter;
        self.fourdayLableYN.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.fourdayLableYN];
        
        self.fivedayLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fivedayLable.textColor=[UIColor whiteColor];
        self.fivedayLable.numberOfLines=1;
        self.fivedayLable.textAlignment=NSTextAlignmentCenter;
        self.fivedayLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.fivedayLable];
        
        
        self.fivedayLableY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fivedayLableY.textColor=[UIColor whiteColor];
        self.fivedayLableY.numberOfLines=1;
        self.fivedayLableY.textAlignment=NSTextAlignmentCenter;
        self.fivedayLableY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.fivedayLableY];
        
        self.fivedayLableYN=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fivedayLableYN.numberOfLines=1;
        self.fivedayLableYN.textColor=[UIColor whiteColor];
        self.fivedayLableYN.textAlignment=NSTextAlignmentCenter;
        self.fivedayLableYN.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.fivedayLableYN];
        
        
        self.sixdayLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.sixdayLable.textColor=[UIColor whiteColor];
        self.sixdayLable.numberOfLines=1;
        self.sixdayLable.textAlignment=NSTextAlignmentCenter;
        self.sixdayLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.sixdayLable];
        
        
        self.sixdayLableY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.sixdayLableY.numberOfLines=1;
        self.sixdayLableY.textColor=[UIColor whiteColor];
        self.sixdayLableY.textAlignment=NSTextAlignmentCenter;
        self.sixdayLableY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.sixdayLableY];
        
        self.sixdayLableYN=[[UILabel alloc]initWithFrame:CGRectZero];
        self.sixdayLableYN.numberOfLines=1;
        self.sixdayLableYN.textColor=[UIColor whiteColor];
        self.sixdayLableYN.textAlignment=NSTextAlignmentCenter;
        self.sixdayLableYN.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.sixdayLableYN];
        
        
        
        self.oneImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.oneImage];
   
        
        self.twoImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.twoImage];
    
        
        self.threeImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.threeImage];
       
        
        self.fourImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.fourImage];
  
        
        self.fiveImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.fiveImage];
  
        
        self.sixImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.sixImage];
 
        
        
        
        self.oneImageN=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.oneImageN];
        
        
        self.twoImageN=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.twoImageN];
        
        
        self.threeImageN=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.threeImageN];
        
        
        self.fourImageN=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.fourImageN];
        
        
        self.fiveImageN=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.fiveImageN];
        
        
        self.sixImageN=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.sixImageN];
        
        
        self.oneTempLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
        self.oneTempLable.textColor=[UIColor grayColor];
        self.oneTempLable.textAlignment=NSTextAlignmentCenter;
        self.oneTempLable.font=[UIFont systemFontOfSize:14];
        [self addSubview:self.oneTempLable];
        
        self.twoTempLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
        self.twoTempLable.textColor=[UIColor whiteColor];
        self.twoTempLable.textAlignment=NSTextAlignmentCenter;
        self.twoTempLable.font=[UIFont systemFontOfSize:14];
        [self addSubview:self.twoTempLable];
        
        
        self.threeTempLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
        self.threeTempLable.textColor=[UIColor whiteColor];
        self.threeTempLable.textAlignment=NSTextAlignmentCenter;
        self.threeTempLable.font=[UIFont systemFontOfSize:14];
        [self addSubview:self.threeTempLable];
        
        
        self.fourTempLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
        self.fourTempLable.textColor=[UIColor whiteColor];
        self.fourTempLable.textAlignment=NSTextAlignmentCenter;
        self.fourTempLable.font=[UIFont systemFontOfSize:14];
        [self addSubview:self.fourTempLable];
        
        
        self.fiveTempLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
        self.fiveTempLable.textColor=[UIColor whiteColor];
        self.fiveTempLable.font=[UIFont systemFontOfSize:14];
        self.fiveTempLable.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.fiveTempLable];
        
        
        
        self.sixTempLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
        self.sixTempLable.textColor=[UIColor whiteColor];
        self.sixTempLable.textAlignment=NSTextAlignmentCenter;
        self.sixTempLable.font=[UIFont systemFontOfSize:14];
        [self addSubview:self.sixTempLable];
        
        
        
        
        self.oneTempLableR=[[UILabel alloc]initWithFrame:CGRectZero];
        self.oneTempLableR.textColor=[UIColor grayColor];
        self.oneTempLableR.font=[UIFont systemFontOfSize:10];
        [self addSubview:self.oneTempLableR];
        
        
        
        self.twoTempLableR=[[UILabel alloc]initWithFrame:CGRectZero];
        self.twoTempLableR.textColor=[UIColor whiteColor];
        self.twoTempLableR.font=[UIFont systemFontOfSize:10];
        [self addSubview:self.twoTempLableR];
        
        
        self.threeTempLableR=[[UILabel alloc]initWithFrame:CGRectZero];
        self.threeTempLableR.textColor=[UIColor whiteColor];
        self.threeTempLableR.font=[UIFont systemFontOfSize:10];
        [self addSubview:self.threeTempLableR];
        
        
        self.fourTempLableR=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fourTempLableR.textColor=[UIColor whiteColor];
        self.fourTempLableR.font=[UIFont systemFontOfSize:10];
        [self addSubview:self.fourTempLableR];
        
        self.fiveTempLableR=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fiveTempLableR.textColor=[UIColor whiteColor];
        self.fiveTempLableR.font=[UIFont systemFontOfSize:10];
        [self addSubview:self.fiveTempLableR];
        
        
        self.sixTempLableR=[[UILabel alloc]initWithFrame:CGRectZero];
        self.sixTempLableR.textColor=[UIColor whiteColor];
        self.sixTempLableR.font=[UIFont systemFontOfSize:10];
        [self addSubview:self.sixTempLableR];
        
        
        self.ADASFSF=[[UIButton alloc]initWithFrame:CGRectMake(0,   0, WIDETH, 100)];
        self.ADASFSF.backgroundColor=[UIColor clearColor];
        [self addSubview:self.ADASFSF];
        
        
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
    
    
    [self.cityLable sizeToFit];
    self.cityLable.left=self.left+15;
    self.cityLable.top=self.locationImageView.bottom+44;
    
    self.cityImage.centerY=self.cityLable.centerY;
    self.cityImage.left=self.cityLable.right+15;
    self.cityButton.left=self.cityImage.left-10;
    self.cityButton.top=self.cityImage.top-20;
    
    [self.weekLable sizeToFit];
    self.weekLable.left=self.cityLable.left;
    self.weekLable.top=self.cityLable.bottom+10;
    
    
    [self.timeLable sizeToFit];
    self.timeLable.left=self.cityLable.left;
    self.timeLable.top=self.weekLable.bottom+5;
    
//    float adafa= [self getTextLength:self.conditionLable];
//    UIImage* DAf=  [IMAGE(@"lianghao") stretchableImageWithLeftCapWidth:30 topCapHeight:0];
//    self.conditionImage.frame=CGRectMake(self.right-adafa-40, self.cityLable.top, adafa+40, DAf.size.height);
//    self.conditionImage.image=DAf;
    self.conditionImage.right=self.right;
    self.conditionImage.centerY=self.cityLable.centerY;
    
    self.conditionLable.centerX=self.conditionImage.centerX+13;
    self.conditionLable.centerY=self.conditionImage.centerY;
    
    
    self.conditionButton.right=self.right;
    self.conditionButton.centerY=self.conditionLable.centerY;
    
    self.oneTempLable.bottom=self.bottom-64;
    self.oneTempLable.left=0;
    
    [self.oneTempLableR sizeToFit];
    self.oneTempLableR.top=self.oneTempLable.top;
    self.oneTempLableR.left=self.oneTempLable.centerX+[self getTextLength:self.oneTempLable]/2;
    
    
    self.twoTempLable.bottom=self.oneTempLable.bottom;
    self.twoTempLable.left=self.oneTempLable.right;
    
    [self.twoTempLableR sizeToFit];
    self.twoTempLableR.top=self.twoTempLable.top;
    self.twoTempLableR.left=self.twoTempLable.centerX+[self getTextLength:self.twoTempLable]/2;
    
    
    
    self.threeTempLable.bottom=self.oneTempLable.bottom;
    self.threeTempLable.left=self.twoTempLable.right;
    
    [self.threeTempLableR sizeToFit];
    self.threeTempLableR.top=self.threeTempLable.top;
    self.threeTempLableR.left=self.threeTempLable.centerX+[self getTextLength:self.threeTempLable]/2;
    
    self.fourTempLable.bottom=self.oneTempLable.bottom;
    self.fourTempLable.left=self.threeTempLable.right;
    
    [self.fourTempLableR sizeToFit];
    self.fourTempLableR.top=self.fourTempLable.top;
    self.fourTempLableR.left=self.fourTempLable.centerX+[self getTextLength:self.fourTempLable]/2;
    
    
    self.fiveTempLable.bottom=self.oneTempLable.bottom;
    self.fiveTempLable.left=self.fourTempLable.right;
    [self.fiveTempLableR sizeToFit];
    self.fiveTempLableR.left=self.fiveTempLable.centerX+[self getTextLength:self.fiveTempLable]/2;
    self.fiveTempLableR.top=self.fiveTempLable.top;
    
    
    
    self.sixTempLable.bottom=self.oneTempLable.bottom;
    self.sixTempLable.left=self.fiveTempLable.right;
    [self.sixTempLableR sizeToFit];
    self.sixTempLableR.top=self.sixTempLable.top;
    self.sixTempLableR.left=self.sixTempLable.centerX+[self getTextLength:self.sixTempLable]/2;
    
    
    [self.onedayLableYN sizeToFit];
    self.onedayLableYN.centerX=self.oneTempLable.centerX;
    self.onedayLableYN.bottom=self.oneTempLable.top-5;
    
    [self.twodayLableYN sizeToFit];
    self.twodayLableYN.centerX=self.twoTempLable.centerX;
    self.twodayLableYN.bottom=self.onedayLableYN.bottom;
    
    [self.threedayLableYN sizeToFit];
    self.threedayLableYN.centerX=self.threeTempLable.centerX;
    self.threedayLableYN.bottom=self.onedayLableYN.bottom;
    
    [self.fourdayLableYN sizeToFit];
    self.fourdayLableYN.centerX=self.fourTempLable.centerX;
    self.fourdayLableYN.bottom=self.onedayLableYN.bottom;
    
    [self.fivedayLableYN sizeToFit];
    self.fivedayLableYN.centerX=self.fiveTempLable.centerX;
    self.fivedayLableYN.bottom=self.onedayLableYN.bottom;
    
    [self.sixdayLableYN sizeToFit];
    self.sixdayLableYN.centerX=self.sixTempLable.centerX;
    self.sixdayLableYN.bottom=self.onedayLableYN.bottom;
    
    
    self.oneImageN.centerX=self.oneTempLable.centerX;
    self.oneImageN.bottom=self.onedayLableYN.top-5;
    
    self.twoImageN.centerX=self.twoTempLable.centerX;
    self.twoImageN.bottom=self.oneImageN.bottom;
    
    self.threeImageN.centerX=self.threeTempLable.centerX;
    self.threeImageN.bottom=self.oneImageN.bottom;
    
    self.fourImageN.centerX=self.fourTempLable.centerX;
    self.fourImageN.bottom=self.oneImageN.bottom;
    
    self.fiveImageN.centerX=self.fiveTempLable.centerX;
    self.fiveImageN.bottom=self.oneImageN.bottom;
    
    self.sixImageN.centerX=self.sixTempLable.centerX;
    self.sixImageN.bottom=self.oneImageN.bottom;
    
    self.oneImage.centerX=self.oneTempLable.centerX;
    self.oneImage.bottom=self.oneImageN.top-5;
    
    self.twoImage.centerX=self.twoTempLable.centerX;
    self.twoImage.bottom=self.oneImage.bottom;
    
    self.threeImage.centerX=self.threeTempLable.centerX;
    self.threeImage.bottom=self.oneImage.bottom;
    
    self.fourImage.centerX=self.fourTempLable.centerX;
    self.fourImage.bottom=self.oneImage.bottom;
    
    self.fiveImage.centerX=self.fiveTempLable.centerX;
    self.fiveImage.bottom=self.oneImage.bottom;
    
    self.sixImage.centerX=self.sixTempLable.centerX;
    self.sixImage.bottom=self.oneImage.bottom;
    
 
    
    
    [self.onedayLableY sizeToFit];
    self.onedayLableY.centerX=self.oneTempLable.centerX;
    self.onedayLableY.bottom=self.oneImage.top-10;
    
    [self.onedayLable sizeToFit];
    self.onedayLable.centerX=self.oneTempLable.centerX;
    self.onedayLable.bottom=self.onedayLableY.top-2;
    
    
    [self.twodayLableY sizeToFit];
    self.twodayLableY.centerX=self.twoTempLable.centerX;
    self.twodayLableY.bottom=self.onedayLableY.bottom;
    
    [self.twodayLable sizeToFit];
    self.twodayLable.centerX=self.twodayLableY.centerX;
    self.twodayLable.bottom=self.twodayLableY.top-2;
    
    [self.threedayLableY sizeToFit];
    self.threedayLableY.centerX=self.threeTempLable.centerX;
    self.threedayLableY.bottom=self.onedayLableY.bottom;
    
    [self.threedayLable sizeToFit];
    self.threedayLable.centerX=self.threedayLableY.centerX;
    self.threedayLable.bottom=self.onedayLable.bottom;
    
    
    [self.fourdayLableY sizeToFit];
    self.fourdayLableY.centerX=self.fourTempLable.centerX;
    self.fourdayLableY.bottom=self.onedayLableY.bottom;
    
    [self.fourdayLable sizeToFit];
    self.fourdayLable.centerX=self.fourdayLableY.centerX;
    self.fourdayLable.bottom=self.onedayLable.bottom;
    
    
    [self.fivedayLableY sizeToFit];
    self.fivedayLableY.centerX=self.fiveTempLable.centerX;
    self.fivedayLableY.bottom=self.onedayLableY.bottom;
    
    [self.fivedayLable sizeToFit];
    self.fivedayLable.centerX=self.fivedayLableY.centerX;
    self.fivedayLable.bottom=self.onedayLable.bottom;
    
    [self.sixdayLableY sizeToFit];
    self.sixdayLableY.centerX=self.sixTempLable.centerX;
    self.sixdayLableY.bottom=self.onedayLableY.bottom;
    [self.sixdayLable sizeToFit];
    self.sixdayLable.centerX=self.sixdayLableY.centerX;
    self.sixdayLable.bottom=self.onedayLable.bottom;
    
    [self.yubaoLable sizeToFit];
    self.yubaoLable.left=self.cityLable.left;
    self.yubaoLable.bottom=self.onedayLable.top-20;
    
    self.coverImageView.centerX=self.centerX;
    self.coverImageView.top=self.yubaoLable.top-10;
    
    self.btToday.centerY=self.yubaoLable.centerY;
    self.btToday.right=self.right-5;
    
    self.dividerImageView.centerX=self.centerX;
    self.dividerImageView.top=self.yubaoLable.bottom+5;
    
    [self.qiyaLable sizeToFit];
    self.qiyaLable.left=self.cityLable.left;
    self.qiyaLable.bottom=self.yubaoLable.top-30;
    
    [self.fengxiangLable sizeToFit];
    self.fengxiangLable.left=self.cityLable.left;
    self.fengxiangLable.bottom=self.qiyaLable.top-5;
    
    [self.tempLabel sizeToFit];
    self.tempLabel.left=self.cityLable.left;
    self.tempLabel.bottom=self.fengxiangLable.top;
    
    
    [self.tempLabelUnit sizeToFit];
    self.tempLabelUnit.top=self.tempLabel.top+10;
    self.tempLabelUnit.left=self.tempLabel.right+5;
    
    [self.tempQingyinLable sizeToFit];
    self.tempQingyinLable.left=self.tempLabel.right+5;
    self.tempQingyinLable.bottom=self.tempLabel.bottom-10;
    
    self.tempImage.bottom=self.tempQingyinLable.bottom;
    self.tempImage.left=self.tempQingyinLable.right+10;
    
    
    self.buttonNext.left=self.cityLable.left;
    self.buttonNext.bottom=self.qiyaLable.bottom;
    
    self.zhexianImage.bottom=self.qiyaLable.bottom+10;
    self.zhexianImage.right=self.right-15;
    self.zhexianButton.center=self.zhexianImage.center;
    
    self.souundImage.bottom=self.zhexianImage.top-15;
    self.souundImage.right=self.zhexianImage.right;
    self.soundButton.center=self.souundImage.center;
    
    self.homeImage.bottom=self.souundImage.top-15;
    self.homeImage.right=self.zhexianImage.right;
    self.homeButton.center=self.homeImage.center;
    
    
    self.ADASFSF.bottom=self.bottom-64;
    self.ADASFSF.centerX=self.centerX;
    
    
}

-(void)recalView{
    CGSize titleSize = [self.tempLabel.text sizeWithFont:self.tempLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 80) lineBreakMode:NSLineBreakByWordWrapping];
    self.tempLabel.frame=CGRectMake(self.cityLable.left,self.fengxiangLable.top-titleSize.height-15, titleSize.width, titleSize.height);
    self.tempLabel.left=self.cityLable.left;
    self.tempLabel.bottom=self.fengxiangLable.top;
    
}

-(float)getTextLength:(UILabel*)adad{
    
    CGSize titleSize = [adad.text sizeWithFont:adad.font constrainedToSize:CGSizeMake(MAXFLOAT, adad.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    return titleSize.width;
}

-(void)DIDselect:(UIButton*)button{
    if (self.delegate) {
        NSInteger index=button.tag;
        switch (index) {
            case 0:
                if ([self.delegate respondsToSelector:@selector(didLocationSelect)]) {
                    [self.delegate didLocationSelect];
                }
                break;
            case 1:
                if ([self.delegate respondsToSelector:@selector(didShareSelect)]) {
                    [self.delegate didShareSelect];
                }
                break;
            case 2:
                if ([self.delegate respondsToSelector:@selector(didZhanKaiSelect)]) {
                    [self.delegate didZhanKaiSelect];
                }
                break;
            case 3:
                if ([self.delegate respondsToSelector:@selector(didShowMain)]) {
                    [self.delegate didShowMain];
                }
                break;
            case 4:
                if ([self.delegate respondsToSelector:@selector(didSHOwSound)]) {
                    [self.delegate didSHOwSound];
                }
                
                break;
            case 5:
                
                if ([self.delegate respondsToSelector:@selector(didShowTianQiYubao)]) {
                    [self.delegate didShowTianQiYubao];
                }
                
                break;
                
            case 10:
                
                if ([self.delegate respondsToSelector:@selector(didShowYujing)]) {
                    [self.delegate didShowYujing];
                }
                
                break;
                
            default:
                break;
        }
        
    }
    
    
}

@end
