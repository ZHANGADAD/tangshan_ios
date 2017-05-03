//
//  CommonListView.m
//  TangShan
//
//  Created by Tony on 1/27/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CommonListView.h"

@implementation CommonListView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.bgImageView=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.bgImageView.frame=CGRectMake(0, 0, WIDETH, HEIGHTH-44);
        [self addSubview:self.bgImageView];
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        [self addSubview:self.locationImageView];
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.locationButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.locationButton];
        
        self.locationLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.locationLable.textColor=[UIColor whiteColor];
        self.locationLable.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:self.locationLable];

        
        
        self.mTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH-44) style:UITableViewStylePlain];
        [self addSubview:self.mTableView];
        
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
    
    self.mTableView.centerX=self.centerX;
    self.mTableView.top=self.locationButton.bottom+44;

}

@end
