//
//  TiqiYubaoView.m
//  TangShan
//
//  Created by chemi ios on 1/1/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "FiveDaysView.h"


#define  hadadd 170

@implementation FiveDaysView

-(instancetype)initWithFrame:(CGRect)frame{
    
    
    self=[super initWithFrame:frame];
    if (self) {
    
        
        self.onedayLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
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
        
        
        self.twodayLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
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
        
        
        self.threedayLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
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
        
        
        self.fourdayLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
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
        
        self.fivedayLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
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
        
        
        self.sixdayLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH/6,20)];
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
        
        
        
        self.oneImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.oneImage];
        self.oneImage.image=IMAGE(@"duoyun");
        
        self.twoImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.twoImage];
        self.twoImage.image=IMAGE(@"qing");
        
        self.threeImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.threeImage];
        self.threeImage.image=IMAGE(@"duoyun");
        
        self.fourImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.fourImage];
        self.fourImage.image=IMAGE(@"qing");
        
        self.fiveImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.fiveImage];
        self.fiveImage.image=IMAGE(@"duoyun");
        
        self.sixImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.sixImage];
        self.sixImage.image=IMAGE(@"qing");
        
        
        
        
        
        self.oneImageY=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.oneImageY];
        self.oneImageY.image=IMAGE(@"duoyun");
        
        self.twoImageY=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.twoImageY];
        self.twoImageY.image=IMAGE(@"qing");
        
        self.threeImageY=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.threeImageY];
        self.threeImageY.image=IMAGE(@"duoyun");
        
        self.fourImageY=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.fourImageY];
        self.fourImageY.image=IMAGE(@"qing");
        
        self.fiveImageY=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.fiveImageY];
        self.fiveImageY.image=IMAGE(@"duoyun");
        
        self.sixImageY=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.sixImageY];
        self.sixImageY.image=IMAGE(@"qing");
        
        self.ADAFFS=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 1)];
        self.ADAFFS.backgroundColor=[UIColor colorWithRed:166/255.0f green:166/255.0f blue:166/255.0f alpha:0.5];
        [self addSubview:self.ADAFFS];
        
        self.ADAFFS1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 1)];
        self.ADAFFS1.backgroundColor=[UIColor colorWithRed:166/255.0f green:166/255.0f blue:166/255.0f alpha:0.5];
        [self addSubview:self.ADAFFS1];
        
        
        
        self.onedayLableYY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.onedayLableYY.textColor=[UIColor grayColor];
        self.onedayLableYY.numberOfLines=1;
        self.onedayLableYY.textAlignment=NSTextAlignmentCenter;
        self.onedayLableYY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.onedayLableYY];
        
        
        self.twodayLableYY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.twodayLableYY.textColor=[UIColor whiteColor];
        self.twodayLableYY.numberOfLines=1;
        self.twodayLableYY.textAlignment=NSTextAlignmentCenter;
        self.twodayLableYY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.twodayLableYY];
        
        
        self.threedayLableYY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.threedayLableYY.textColor=[UIColor whiteColor];
        self.threedayLableYY.numberOfLines=1;
        self.threedayLableYY.textAlignment=NSTextAlignmentCenter;
        self.threedayLableYY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.threedayLableYY];
        
        
        self.fourdayLableYY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fourdayLableYY.textColor=[UIColor whiteColor];
        self.fourdayLableYY.numberOfLines=1;
        self.fourdayLableYY.textAlignment=NSTextAlignmentCenter;
        self.fourdayLableYY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.fourdayLableYY];
        
        
        self.fivedayLableYY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fivedayLableYY.textColor=[UIColor whiteColor];
        self.fivedayLableYY.numberOfLines=1;
        self.fivedayLableYY.textAlignment=NSTextAlignmentCenter;
        self.fivedayLableYY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.fivedayLableYY];
        
        
        self.sixdayLableYY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.sixdayLableYY.textColor=[UIColor whiteColor];
        self.sixdayLableYY.numberOfLines=1;
        self.sixdayLableYY.textAlignment=NSTextAlignmentCenter;
        self.sixdayLableYY.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.sixdayLableYY];
        
        
        
        self.onedayLableY1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.onedayLableY1.textColor=[UIColor grayColor];
        self.onedayLableY1.numberOfLines=1;
        self.onedayLableY1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.onedayLableY1];
        
        self.twodayLableY1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.twodayLableY1.textColor=[UIColor whiteColor];
        self.twodayLableY1.numberOfLines=1;
        self.twodayLableY1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.twodayLableY1];
        
        self.threedayLableY1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.threedayLableY1.textColor=[UIColor whiteColor];
        self.threedayLableY1.numberOfLines=1;
        self.threedayLableY1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.threedayLableY1];
        
        self.fourdayLableY1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fourdayLableY1.textColor=[UIColor whiteColor];
        self.fourdayLableY1.numberOfLines=1;
        self.fourdayLableY1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.fourdayLableY1];
        
        self.fivedayLableY1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fivedayLableY1.textColor=[UIColor whiteColor];
        self.fivedayLableY1.numberOfLines=1;
        self.fivedayLableY1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.fivedayLableY1];
        
        self.sixdayLableY1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.sixdayLableY1.textColor=[UIColor whiteColor];
        self.sixdayLableY1.numberOfLines=1;
        self.sixdayLableY1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.sixdayLableY1];
        
        
        
        self.onedayLableF1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.onedayLableF1.textColor=[UIColor whiteColor];
        self.onedayLableF1.numberOfLines=2;
        self.onedayLableF1.textAlignment=NSTextAlignmentCenter;
        self.onedayLableF1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.onedayLableF1];
        
        self.twodayLableF1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.twodayLableF1.textColor=[UIColor whiteColor];
        self.twodayLableF1.numberOfLines=2;
        self.twodayLableF1.textAlignment=NSTextAlignmentCenter;
        self.twodayLableF1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.twodayLableF1];
        
        self.threedayLableF1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.threedayLableF1.textColor=[UIColor whiteColor];
        self.threedayLableF1.numberOfLines=2;
        self.threedayLableF1.textAlignment=NSTextAlignmentCenter;
        self.threedayLableF1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.threedayLableF1];
        
        self.fourdayLableF1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fourdayLableF1.textColor=[UIColor whiteColor];
        self.fourdayLableF1.numberOfLines=2;
        self.fourdayLableF1.textAlignment=NSTextAlignmentCenter;
        self.fourdayLableF1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.fourdayLableF1];
        
        self.fivedayLableF1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fivedayLableF1.textColor=[UIColor whiteColor];
        self.fivedayLableF1.numberOfLines=2;
        self.fivedayLableF1.textAlignment=NSTextAlignmentCenter;
        self.fivedayLableF1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.fivedayLableF1];
        
        self.sixdayLableF1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.sixdayLableF1.textColor=[UIColor whiteColor];
        self.sixdayLableF1.numberOfLines=2;
        self.sixdayLableF1.textAlignment=NSTextAlignmentCenter;
        self.sixdayLableF1.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.sixdayLableF1];
        
        
        
        self.onedayLableF=[[UILabel alloc]initWithFrame:CGRectZero];
        self.onedayLableF.textColor=[UIColor whiteColor];
        self.onedayLableF.numberOfLines=2;
        self.onedayLableF.textAlignment=NSTextAlignmentCenter;
        self.onedayLableF.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.onedayLableF];
        
        self.twodayLableF=[[UILabel alloc]initWithFrame:CGRectZero];
        self.twodayLableF.textColor=[UIColor whiteColor];
        self.twodayLableF.numberOfLines=2;
        self.twodayLableF.textAlignment=NSTextAlignmentCenter;
        self.twodayLableF.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.twodayLableF];
        
        self.threedayLableF=[[UILabel alloc]initWithFrame:CGRectZero];
        self.threedayLableF.textColor=[UIColor whiteColor];
        self.threedayLableF.numberOfLines=2;
        self.threedayLableF.textAlignment=NSTextAlignmentCenter;
        self.threedayLableF.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.threedayLableF];
        
        self.fourdayLableF=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fourdayLableF.textColor=[UIColor whiteColor];
        self.fourdayLableF.numberOfLines=2;
        self.fourdayLableF.textAlignment=NSTextAlignmentCenter;
        self.fourdayLableF.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.fourdayLableF];
        
        self.fivedayLableF=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fivedayLableF.textColor=[UIColor whiteColor];
        self.fivedayLableF.numberOfLines=2;
        self.fivedayLableF.textAlignment=NSTextAlignmentCenter;
        self.fivedayLableF.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.fivedayLableF];
        
        self.sixdayLableF=[[UILabel alloc]initWithFrame:CGRectZero];
        self.sixdayLableF.textColor=[UIColor whiteColor];
        self.sixdayLableF.numberOfLines=2;
        self.sixdayLableF.textAlignment=NSTextAlignmentCenter;
        self.sixdayLableF.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.sixdayLableF];
        
        
        
        
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];

    
    self.onedayLable.left=0;
    self.onedayLable.top=self.top+20;
    
    self.twodayLable.left=self.onedayLable.right;
    self.twodayLable.bottom=self.onedayLable.bottom;
    
    self.threedayLable.left=self.twodayLable.right;
    self.threedayLable.bottom=self.onedayLable.bottom;
    
    self.fourdayLable.left=self.threedayLable.right;
    self.fourdayLable.bottom=self.onedayLable.bottom;
    
    self.fivedayLable.left=self.fourdayLable.right;
    self.fivedayLable.bottom=self.onedayLable.bottom;
    
    self.sixdayLable.left=self.fivedayLable.right;
    self.sixdayLable.bottom=self.onedayLable.bottom;
    
    [self.onedayLableY sizeToFit];
    self.onedayLableY.centerX=self.onedayLable.centerX;
    self.onedayLableY.top=self.onedayLable.bottom+5;
    
    
    
    [self.twodayLableY sizeToFit];
    self.twodayLableY.centerX=self.twodayLable.centerX;
    self.twodayLableY.bottom=self.onedayLableY.bottom;
    
    
    
    [self.threedayLableY sizeToFit];
    self.threedayLableY.centerX=self.threedayLable.centerX;
    self.threedayLableY.bottom=self.onedayLableY.bottom;
    
    
    
    
    
    [self.fourdayLableY sizeToFit];
    self.fourdayLableY.centerX=self.fourdayLable.centerX;
    self.fourdayLableY.bottom=self.onedayLableY.bottom;
    
    
    
    
    [self.fivedayLableY sizeToFit];
    self.fivedayLableY.centerX=self.fivedayLable.centerX;
    self.fivedayLableY.bottom=self.onedayLableY.bottom;
    
    
    
    [self.sixdayLableY sizeToFit];
    self.sixdayLableY.centerX=self.sixdayLable.centerX;
    self.sixdayLableY.bottom=self.onedayLableY.bottom;
    
    
    self.oneImage.centerX=self.onedayLable.centerX;
    self.oneImage.top=self.onedayLableY.bottom+10;
    
    self.twoImage.centerX=self.twodayLable.centerX;
    self.twoImage.bottom=self.oneImage.bottom;
    
    self.threeImage.centerX=self.threedayLable.centerX;
    self.threeImage.bottom=self.oneImage.bottom;
    
    self.fourImage.centerX=self.fourdayLable.centerX;
    self.fourImage.bottom=self.oneImage.bottom;
    
    self.fiveImage.centerX=self.fivedayLable.centerX;
    self.fiveImage.bottom=self.oneImage.bottom;
    
    self.sixImage.centerX=self.sixdayLable.centerX;
    self.sixImage.bottom=self.oneImage.bottom;
    
    
    
    
    [self.onedayLableF1 sizeToFit];
    self.onedayLableF1.centerX=self.onedayLable.centerX;
    self.onedayLableF1.top=self.sixImage.bottom+10;
    
    
    [self.twodayLableF1 sizeToFit];
    self.twodayLableF1.centerX=self.twodayLable.centerX;
    self.twodayLableF1.top=self.onedayLableF1.top;
    
    [self.threedayLableF1 sizeToFit];
    self.threedayLableF1.centerX=self.threedayLable.centerX;
    self.threedayLableF1.top=self.onedayLableF1.top;
    
    [self.fourdayLableF1 sizeToFit];
    self.fourdayLableF1.centerX=self.fourdayLable.centerX;
    self.fourdayLableF1.top=self.onedayLableF1.top;
    
    [self.fivedayLableF1 sizeToFit];
    self.fivedayLableF1.centerX=self.fivedayLable.centerX;
    self.fivedayLableF1.top=self.onedayLableF1.top;
    
    [self.sixdayLableF1 sizeToFit];
    self.sixdayLableF1.centerX=self.sixdayLable.centerX;
    self.sixdayLableF1.top=self.onedayLableF1.top;

    
    
    self.ADAFFS.centerX=self.centerX;
    self.ADAFFS.top=self.onedayLableF1.bottom+10;
    
    
    self.oneImageY.centerX=self.oneImage.centerX;
    self.oneImageY.top=self.oneImage.bottom+hadadd+50;
    
    self.twoImageY.centerX=self.twodayLable.centerX;
    self.twoImageY.bottom=self.oneImageY.bottom;
    
    self.threeImageY.centerX=self.threedayLable.centerX;
    self.threeImageY.bottom=self.oneImageY.bottom;
    
    self.fourImageY.centerX=self.fourdayLable.centerX;
    self.fourImageY.bottom=self.oneImageY.bottom;
    
    self.fiveImageY.centerX=self.fivedayLable.centerX;
    self.fiveImageY.bottom=self.oneImageY.bottom;
    
    self.sixImageY.centerX=self.sixdayLable.centerX;
    self.sixImageY.bottom=self.oneImageY.bottom;
    
    [self.onedayLableYY sizeToFit];
    self.onedayLableYY.centerX=self.onedayLable.centerX;
    self.onedayLableYY.top=self.oneImageY.bottom+5;
    
    
    [self.twodayLableYY sizeToFit];
    self.twodayLableYY.centerX=self.twodayLable.centerX;
    self.twodayLableYY.top=self.onedayLableYY.top;
    
    [self.threedayLableYY sizeToFit];
    self.threedayLableYY.centerX=self.threedayLable.centerX;
    self.threedayLableYY.top=self.onedayLableYY.top;
    
    [self.fourdayLableYY sizeToFit];
    self.fourdayLableYY.centerX=self.fourdayLable.centerX;
    self.fourdayLableYY.top=self.onedayLableYY.top;
    
    [self.fivedayLableYY sizeToFit];
    self.fivedayLableYY.centerX=self.fivedayLable.centerX;
    self.fivedayLableYY.top=self.onedayLableYY.top;
    
    [self.sixdayLableYY sizeToFit];
    self.sixdayLableYY.centerX=self.sixdayLable.centerX;
    self.sixdayLableYY.top=self.onedayLableYY.top;
    
    
    
    [self.onedayLableY1 sizeToFit];
    self.onedayLableY1.centerX=self.onedayLable.centerX;
    self.onedayLableY1.top=self.sixdayLableYY.bottom+5;
    
    [self.twodayLableY1 sizeToFit];
    self.twodayLableY1.centerX=self.twodayLable.centerX;
    self.twodayLableY1.top=self.onedayLableY1.top;
    
    [self.threedayLableY1 sizeToFit];
    self.threedayLableY1.centerX=self.threedayLable.centerX;
    self.threedayLableY1.top=self.onedayLableY1.top;
    
    [self.fourdayLableY1 sizeToFit];
    self.fourdayLableY1.centerX=self.fourdayLable.centerX;
    self.fourdayLableY1.top=self.onedayLableY1.top;
    
    [self.fivedayLableY1 sizeToFit];
    self.fivedayLableY1.centerX=self.fivedayLable.centerX;
    self.fivedayLableY1.top=self.onedayLableY1.top;
    
    [self.sixdayLableY1 sizeToFit];
    self.sixdayLableY1.centerX=self.sixdayLable.centerX;
    self.sixdayLableY1.top=self.onedayLableY1.top;
    
    
    [self.onedayLableY1 sizeToFit];
    self.onedayLableY1.centerX=self.onedayLable.centerX;
    self.onedayLableY1.top=self.sixdayLableYY.bottom+5;
    
    [self.twodayLableY1 sizeToFit];
    self.twodayLableY1.centerX=self.twodayLable.centerX;
    self.twodayLableY1.top=self.onedayLableY1.top;
    
    [self.threedayLableY1 sizeToFit];
    self.threedayLableY1.centerX=self.threedayLable.centerX;
    self.threedayLableY1.top=self.onedayLableY1.top;
    
    [self.fourdayLableY1 sizeToFit];
    self.fourdayLableY1.centerX=self.fourdayLable.centerX;
    self.fourdayLableY1.top=self.onedayLableY1.top;
    
    [self.fivedayLableY1 sizeToFit];
    self.fivedayLableY1.centerX=self.fivedayLable.centerX;
    self.fivedayLableY1.top=self.onedayLableY1.top;
    
    [self.sixdayLableY1 sizeToFit];
    self.sixdayLableY1.centerX=self.sixdayLable.centerX;
    self.sixdayLableY1.top=self.onedayLableY1.top;
    
    self.ADAFFS1.centerX=self.centerX;
    self.ADAFFS1.top=self.sixdayLableY1.bottom+10;
    
    [self.onedayLableF sizeToFit];
    self.onedayLableF.centerX=self.onedayLable.centerX;
    self.onedayLableF.top=self.sixdayLableY1.bottom+15;
    
    [self.twodayLableF sizeToFit];
    self.twodayLableF.centerX=self.twodayLable.centerX;
    self.twodayLableF.top=self.onedayLableF.top;
    
    [self.threedayLableF sizeToFit];
    self.threedayLableF.centerX=self.threedayLable.centerX;
    self.threedayLableF.top=self.onedayLableF.top;
    
    [self.fourdayLableF sizeToFit];
    self.fourdayLableF.centerX=self.fourdayLable.centerX;
    self.fourdayLableF.top=self.onedayLableF.top;
    
    [self.fivedayLableF sizeToFit];
    self.fivedayLableF.centerX=self.fivedayLable.centerX;
    self.fivedayLableF.top=self.onedayLableF.top;
    
    [self.sixdayLableF sizeToFit];
    self.sixdayLableF.centerX=self.sixdayLable.centerX;
    self.sixdayLableF.top=self.onedayLableF.top;
    
    
}


-(float)getTextLength:(UILabel*)adad{
    
    CGSize titleSize = [adad.text sizeWithFont:adad.font constrainedToSize:CGSizeMake(MAXFLOAT, adad.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    return titleSize.width;
}
@end
