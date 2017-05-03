//
//  NongyeDetailsView.m
//  TangShan
//
//  Created by Tony on 12/22/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "NongyeDetailsView.h"

@implementation NongyeDetailsView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.bgImageView=[[UIImageView alloc]initWithImage:IMAGE(@"back_share")];
        [self addSubview:self.bgImageView];
        
        self.lableContent=[[UILabel alloc]initWithFrame:frame];
        self.lableContent.textColor=[UIColor whiteColor];
        self.lableContent.numberOfLines=0;
        self.lableContent.lineBreakMode=NSLineBreakByWordWrapping;
        self.lableContent.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.lableContent];
        
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        [self addSubview:self.locationImageView];
        
        self.locationLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.locationLable.textColor=[UIColor whiteColor];
        self.locationLable.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:self.locationLable];
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        [self.locationButton setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.locationButton];

    
    }
    return self;

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.bgImageView.centerX=self.centerX;
    self.bgImageView.top=self.top;
    
    self.lableContent.centerX=self.centerX;
    self.lableContent.top=self.top+50;
    
    
    [self.locationLable sizeToFit];
    self.locationLable.centerX=self.centerX+6;
    if (IS_IPHONE_5_HEIGHT) {
        self.locationLable.top=25;
    }else{
        self.locationLable.top=30;
    }

    
    self.locationButton.centerY=self.locationLable.centerY;
    self.locationButton.left=self.left;
    
    self.locationImageView.centerY=self.locationLable.centerY;
    self.locationImageView.right=self.locationLable.left-10;

}
@end
