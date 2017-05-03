//
//  LLView.m
//  TangShan
//
//  Created by Tony on 1/31/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "LLView.h"

@implementation LLView


-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {

        self.imageView=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.imageView.frame=CGRectMake(0, 0, WIDETH, HEIGHTH-44);
        [self addSubview:self.imageView];
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        [self addSubview:self.locationImageView];
        
        self.locationLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.locationLable.textColor=[UIColor whiteColor];
        self.locationLable.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:self.locationLable];
        
        
        self.mTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH-64-44)];
        self.mTableView.backgroundColor=[UIColor clearColor];
        [self addSubview:self.mTableView];

        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.locationButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.locationButton];
        
        
    }
    return  self;
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
    
    
    self.locationButton.centerY=self.locationLable.centerY;
    self.locationButton.left=self.left;
    
    self.locationImageView.centerY=self.locationLable.centerY;
    self.locationImageView.right=self.locationLable.left-10;
    
    self.mTableView.top=self.locationLable.bottom+30;
    self.mTableView.centerX=self.centerX;

}

@end
