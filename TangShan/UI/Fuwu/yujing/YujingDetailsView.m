//
//  YujingDetailsView.m
//  TangShan
//
//  Created by Tony on 1/25/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "YujingDetailsView.h"

@implementation YujingDetailsView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.bgImageView=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.bgImageView.frame=self.frame;
        [self addSubview:self.bgImageView];
        
        
        self.locationLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.locationLable.textColor=[UIColor whiteColor];
        self.locationLable.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:self.locationLable];
        
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        [self addSubview:self.locationImageView];
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.locationButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.locationButton];
        
        self.yujingImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 26)];
        self.yujingImageView.contentMode=UIViewContentModeScaleAspectFit;
        [self addSubview:self.yujingImageView];
        
        self.yujingTitleLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.yujingTitleLable.textColor=[UIColor whiteColor];
        self.yujingTitleLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.yujingTitleLable];
        
        self.yujingDDDD=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 1)];
        self.yujingDDDD.backgroundColor=[UIColor colorWithHexString:@"0x4388c9"];
        [self addSubview:self.yujingDDDD];
        
        
        
        self.yujingTimeLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.yujingTimeLable.textColor=[UIColor whiteColor];
        self.yujingTimeLable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.yujingTimeLable];
        
        self.yujinDSadsafAFF=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 1)];
        self.yujinDSadsafAFF.backgroundColor=[UIColor colorWithHexString:@"0x4388c9"];
        [self addSubview:self.yujinDSadsafAFF];
        

        self.yujinDSAFF=[[UIImageView alloc]initWithImage:IMAGE(@"dddd")];
        [self addSubview:self.yujinDSAFF];
        
     
        self.yable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.yable.textColor=[UIColor whiteColor];
        self.yable.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.yable];
        self.yable.text=@"预警内容";


        
        self.yujingContentLable=[[myUILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, HEIGHTH-80)];
        self.yujingContentLable.textColor=[UIColor whiteColor];
        self.yujingContentLable.numberOfLines=0;
        self.yujingContentLable.textAlignment=NSTextAlignmentLeft;
        self.yujingContentLable.lineBreakMode=NSLineBreakByWordWrapping;
        self.yujingContentLable.font=[UIFont systemFontOfSize:16];
        [self.yujingContentLable setVerticalAlignment:VerticalAlignmentTop];
        [self addSubview:self.yujingContentLable];
        
    }
    return self;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bgImageView.top=self.top;
    self.bgImageView.centerX=self.centerX;
    
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
    
    
    self.yujingImageView.left=self.left+10;
    self.yujingImageView.top=self.locationButton.bottom+20;
    
    [self.yujingTitleLable sizeToFit];
    self.yujingTitleLable.left=self.yujingImageView.right+10;
    self.yujingTitleLable.centerY=self.yujingImageView.centerY;
    
    self.yujingDDDD.centerX=self.centerX;
    self.yujingDDDD.top=self.yujingTitleLable.bottom+10;
    
    [self.yujingTimeLable sizeToFit];
    self.yujingTimeLable.left=self.yujingImageView.left;
    self.yujingTimeLable.top=self.yujingDDDD.bottom+10;
    
    
    self.yujinDSadsafAFF.centerX=self.centerX;
    self.yujinDSadsafAFF.top=self.yujingTimeLable.bottom+10;
    
    
    self.yujinDSAFF.left=self.yujingImageView.left;
    self.yujinDSAFF.top=self.yujinDSadsafAFF.bottom+10;
    
    [self.yable sizeToFit];
    self.yable.centerY=self.yujinDSAFF.centerY;
    self.yable.left=self.yujinDSAFF.right+5;
    
    self.yujingContentLable.left=self.yujingImageView.left;
    self.yujingContentLable.top=self.yable.bottom+10;
}

@end
