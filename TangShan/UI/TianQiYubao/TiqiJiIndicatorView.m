//
//  TiqiIndicatorView.m
//  TangShan
//
//  Created by chemi ios on 1/2/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TiqiJiIndicatorView.h"

@interface TiqiJiIndicatorView()

@property(assign,nonatomic)CGFloat AFSASF;

@end

@implementation TiqiJiIndicatorView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
      
        
        self.dasfsg=[[UIImageView alloc]initWithImage:IMAGE(@"badadf")];
        [self addSubview:self.dasfsg];
        
        self.tiqiLaleContent=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 33, 23)];
        self.tiqiLaleContent.textColor=[UIColor whiteColor];
        self.tiqiLaleContent.font=[UIFont systemFontOfSize:14];
        self.tiqiLaleContent.textAlignment=NSTextAlignmentCenter;
        self.tiqiLaleContent.text=@"1";
        [self addSubview:self.tiqiLaleContent];
    }
    return self;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.dasfsg.center=self.center;
    
    self.tiqiLaleContent.centerX=self.dasfsg.centerX;
    self.tiqiLaleContent.centerY=self.dasfsg.centerY-2;
}

-(float)getTextLength:(UILabel*)adad{
    
    CGSize titleSize = [adad.text sizeWithFont:adad.font constrainedToSize:CGSizeMake(MAXFLOAT, adad.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    return titleSize.width;
}

@end
