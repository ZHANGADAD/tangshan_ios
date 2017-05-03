
//
//  CitySearchView.m
//  TangShan
//
//  Created by Tony on 1/7/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CitySearchView.h"

@implementation CitySearchView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    
    if (self) {
        self.BADAD=[[UIImageView alloc]initWithImage:IMAGE(@"sacadad")];
        self.BADAD.frame=self.frame;
        [self addSubview:self.BADAD];
        
        
        self.searchBAR=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 270, 40)];
        [self.searchBAR setTextColor:[UIColor colorWithHexString:@"0x333333"]];
        self.searchBAR.clearButtonMode=UITextFieldViewModeWhileEditing;
        self.searchBAR.returnKeyType=UIReturnKeyDone;
        [self addSubview:self.searchBAR];
        
        self.button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        self.button.backgroundColor=[UIColor clearColor];
        [self.button setTitle:@"取消" forState:UIControlStateNormal];
        [self.button setTitle:@"取消" forState:UIControlStateHighlighted];
        [self.button setTitleColor:[UIColor colorWithHexString:@"0x333333"] forState:UIControlStateHighlighted];
        [self.button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [self addSubview:self.button];
        
        
        self.mTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH) style:UITableViewStylePlain];
        [self addSubview:self.mTableView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.BADAD.top=self.top;
    self.centerX=self.centerX;
    if (IS_IPHONE_6P_HEIGHT) {
        self.searchBAR.top=self.top+40;
        self.searchBAR.left=self.left+45;
    }else{
        self.searchBAR.top=self.top+35;
        self.searchBAR.left=self.left+40;
    }
    
    
    
    self.mTableView.top=self.searchBAR.bottom+10;
    self.mTableView.centerX=self.centerX;
    
    self.button.right=self.right;
    self.button.centerY=self.searchBAR.centerY;
    
}
@end
