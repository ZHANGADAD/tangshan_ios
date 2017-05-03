//
//  TiqiIndicatorView.m
//  TangShan
//
//  Created by chemi ios on 1/2/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TiqiIndicatorView.h"

@interface TiqiIndicatorView()

@property(assign,nonatomic)CGFloat AFSASF;

@end

@implementation TiqiIndicatorView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        
        self.dasfsg=[[UIImageView alloc]initWithImage:IMAGE(@"badadf")];
        [self addSubview:self.dasfsg];
        
        self.tiqiLaleContent=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 33, 23)];
        self.tiqiLaleContent.textColor=[UIColor whiteColor];
        self.tiqiLaleContent.font=[UIFont systemFontOfSize:14];
        self.tiqiLaleContent.textAlignment=NSTextAlignmentCenter;
        self.tiqiLaleContent.text=@"1";
        [self addSubview:self.tiqiLaleContent];
        
        
        self.tiqiLaleContentUnit=[[UILabel alloc]initWithFrame:CGRectZero];
        self.tiqiLaleContentUnit.textColor=[UIColor whiteColor];
        self.tiqiLaleContentUnit.font=[UIFont systemFontOfSize:8];
        [self addSubview:self.tiqiLaleContentUnit];
        self.tiqiLaleContentUnit.text=@"o";
        [self.tiqiLaleContentUnit setHidden:YES];
        
    }
    return self;

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.dasfsg.center=self.center;
    
    self.tiqiLaleContent.centerX=self.dasfsg.centerX;
    self.tiqiLaleContent.centerY=self.dasfsg.centerY-2;
    
    [self.tiqiLaleContentUnit sizeToFit];
    self.tiqiLaleContentUnit.top=self.tiqiLaleContent.top+2;
    self.tiqiLaleContentUnit.left=self.tiqiLaleContent.centerX+[self getTextLength:self.tiqiLaleContent]/2+2;
}

-(float)getTextLength:(UILabel*)adad{
    
    CGSize titleSize = [adad.text sizeWithFont:adad.font constrainedToSize:CGSizeMake(MAXFLOAT, adad.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    return titleSize.width;
}

@end
