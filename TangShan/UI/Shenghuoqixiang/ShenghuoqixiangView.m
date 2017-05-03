//
//  ShenghuoqixiangView.m
//  TangShan
//
//  Created by Tony on 1/6/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "ShenghuoqixiangView.h"

@implementation ShenghuoqixiangView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        
        
        self.adaF=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.adaF.frame=self.frame;
        [self addSubview:self.adaF];
        
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.locationButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.locationButton];
        
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        [self addSubview:self.locationImageView];
        
        self.locationLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.locationLable.textColor=[UIColor whiteColor];
        self.locationLable.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:self.locationLable];
    
        
        if(IS_IPHONE_5_HEIGHT){
            self.segementControl=[[HMSegmentedControl alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
        }else{
            self.segementControl=[[HMSegmentedControl alloc]initWithFrame:CGRectMake(0, 0, 210, 30)];
        }
        
        [self.segementControl setSectionTitles:[NSArray arrayWithObjects:@"今天",@"明天",@"后天", nil]];
        [self.segementControl setSelectionIndicatorMode:HMSelectionIndicatorFillsSegment];
        [self.segementControl setTextColor:[UIColor whiteColor]];
        [self addSubview:self.segementControl];
        [self.segementControl setHidden:YES];

        
        self.mTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH-64-24-44-20) style:UITableViewStylePlain];
        self.mTableView.backgroundColor=[UIColor clearColor];
        self.mTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.mTableView.separatorColor = [UIColor colorWithRed:52.0f/255.0f green:53.0f/255.0f blue:61.0f/255.0f alpha:1];
        
        [self addSubview:self.mTableView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.adaF.top=self.top;
    self.adaF.centerX=self.centerX;
    
    
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
    
    self.segementControl.top=self.locationButton.bottom+20;
    self.segementControl.left=self.left+10;
    
    self.mTableView.top=self.locationButton.bottom+20;
    self.mTableView.centerX=self.centerX;
    
}
@end
