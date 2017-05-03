//
//  ShenghuoTableViewCell.m
//  TangShan
//
//  Created by Tony on 1/6/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "ShenghuoQTableViewCell.h"

@implementation ShenghuoQTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor=[UIColor clearColor];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        self.contentView.backgroundColor=[UIColor clearColor];        
        self.imageViewConten=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        [self.contentView addSubview:self.imageViewConten];
        
        self.mLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.mLable.textColor=[UIColor whiteColor];
        self.mLable.numberOfLines=1;
        self.mLable.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.mLable];
        
        
        self.mLableContent=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH-120, 60)];
        self.mLableContent.textColor=[UIColor whiteColor];
        self.mLableContent.font=[UIFont systemFontOfSize:16];
        self.mLableContent.lineBreakMode=NSLineBreakByWordWrapping;
        self.mLableContent.numberOfLines=2;
        [self.contentView addSubview:self.mLableContent];

    }
    return self;

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageViewConten.left=self.left+10;
    self.imageViewConten.centerY=self.contentView.centerY;
    
    [self.mLable sizeToFit];
    self.mLable.left=self.imageViewConten.right+20;
    self.mLable.top=self.imageViewConten.top;
    
    self.mLableContent.bottom=self.contentView.bottom-10;
    self.mLableContent.left=self.mLable.left;
}

@end
