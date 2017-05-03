//
//  TianqiContentView.m
//  TangShan
//
//  Created by chemi ios on 2/27/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TianqiContentView.h"
@interface TianqiContentView()
@property(assign,nonatomic)BOOL isFuture;
@end;

@implementation TianqiContentView


-(instancetype)initWithFrame:(CGRect)frame isFuture:(BOOL)isFuture{
    self.isFuture=isFuture;
    return [self initWithFrame:frame];
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        
        if(IS_IPHONE_5_HEIGHT){
            self.segementWendu=[[HMSegmentedControl alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
        }else{
            self.segementWendu=[[HMSegmentedControl alloc]initWithFrame:CGRectMake(0, 0, 210, 30)];
        }
//        [self.segementWendu setSectionTitles:[NSArray arrayWithObjects:@"温度",@"风力",nil]];
        if (self.isFuture) {
             [self.segementWendu setSectionTitles:[NSArray arrayWithObjects:@"温度",@"风力",nil]];
        }else{
             [self.segementWendu setSectionTitles:[NSArray arrayWithObjects:@"温度",@"风力",@"降水", nil]];
        }
    
        [self.segementWendu setSelectionIndicatorMode:HMSelectionIndicatorFillsSegment];
        [self.segementWendu setTextColor:[UIColor whiteColor]];
        [self addSubview:self.segementWendu];
        
        self.lableWenDuTime=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lableWenDuTime.textColor=[UIColor whiteColor];
        self.lableWenDuTime.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.lableWenDuTime];
        
        
        
        self.mTempScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, GraphViewWenDuHeight+GADAFSFF)];
        [self addSubview:self.mTempScrollView];
        
        
        self.indicatorView=[[TiqiIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        [self.mTempScrollView addSubview:self.indicatorView];
        
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];

    self.segementWendu.left=0;
    self.segementWendu.top=self.top;
    
    [self.lableWenDuTime sizeToFit];
    self.lableWenDuTime.centerY=self.segementWendu.centerY;
    self.lableWenDuTime.right=WIDETH-10;
    
    
    self.mTempScrollView.left=0;
    self.mTempScrollView.top=self.segementWendu.bottom+40;
    
    if (IS_IPHONE_5_HEIGHT) {
        self.indicatorView.bottom=self.mTempScrollView.top-65;
    }else if(IS_IPHONE_6P_HEIGHT){
        self.indicatorView.bottom=self.mTempScrollView.top-77;
    }else{
        self.indicatorView.bottom=self.mTempScrollView.top+36;
    }
    
    self.indicatorView.left=self.mTempScrollView.left+15;


}
@end
