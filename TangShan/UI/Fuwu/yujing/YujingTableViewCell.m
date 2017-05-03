//
//  YujingTableViewCell.m
//  TangShan
//
//  Created by Tony on 12/22/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "YujingTableViewCell.h"

@implementation YujingTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor=[UIColor clearColor];
        self.
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor=[UIColor clearColor];
        
        self.yujingImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 26)];
        [self.contentView addSubview:self.yujingImageView];
        
        self.yujingTitleLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH-30, 40)];
        self.yujingTitleLable.textColor=[UIColor whiteColor];
        self.yujingTimeLable.numberOfLines=1;
        self.yujingTimeLable.lineBreakMode=NSLineBreakByTruncatingTail;
        self.yujingTitleLable.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.yujingTitleLable];
        
        self.yujingImageViewDivider=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"0x4388c9"]]];
        self.yujingImageViewDivider.frame=CGRectMake(0, 0, WIDETH, 1);
        [self.contentView addSubview:self.yujingImageViewDivider];
        
        self.yujingTimeLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.yujingTimeLable.textColor=[UIColor whiteColor];
        self.yujingTimeLable.numberOfLines=1;
        self.yujingTimeLable.lineBreakMode=NSLineBreakByTruncatingTail;
        self.yujingTimeLable.font=[UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.yujingTimeLable];
        
        self.yujingImageViewDivider1=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"0x4388c9"]]];
        self.yujingImageViewDivider1.frame=CGRectMake(0, 0, WIDETH, 1);
        [self.contentView addSubview:self.yujingImageViewDivider1];
        
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];

    self.yujingImageView.left=self.contentView.left+15;
    self.yujingImageView.top=self.contentView.top+10;
    
    
    self.yujingTitleLable.left=self.yujingImageView.right+10;
    self.yujingTitleLable.centerY=self.yujingImageView.centerY;
    
    self.yujingImageViewDivider.top=self.yujingTitleLable.bottom+5;
    self.yujingImageViewDivider.centerX=self.contentView.centerX;
    
    [self.yujingTimeLable sizeToFit];
    self.yujingTimeLable.left=self.yujingTitleLable.left;
    self.yujingTimeLable.top=self.yujingImageViewDivider.bottom+10;
    
    self.yujingImageViewDivider1.centerX=self.contentView.centerX;
    self.yujingImageViewDivider1.bottom=self.contentView.bottom-5;
}

@end
